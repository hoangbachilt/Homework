class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        # Log the user in and redirect to the user's show page.
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        remember user
        # redirect_to root_url
        redirect_back_or users_url
      else
        message = "Account not activated"
        message += "Check your email for the the activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      flash.now[:danger] ='Invalid email/password combination '
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end