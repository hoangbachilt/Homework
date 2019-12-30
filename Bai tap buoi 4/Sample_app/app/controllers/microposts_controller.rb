class MicropostsController < ApplicationController
	def index
		@microposts = current_user.microposts.page(params[:page])
			.order(created_at: :desc)
	end

	def create
		micropost= current_user.microposts.create(content: params[:micropost][:content])
		if micropost.save
			flash[:success] = "New micropost created"
		else
			flash[:danger] = "Error create micropost"
		end
		redirect_to action: :index
	end
end
