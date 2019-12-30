class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.integer :user_id
      t.string :content
      t.string :timestamps

      t.timestamps
    end
  end

  
end
