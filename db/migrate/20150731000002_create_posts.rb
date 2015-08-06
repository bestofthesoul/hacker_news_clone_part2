

class CreatePosts < ActiveRecord::Migration
  def change

    create_table  :posts do |x|
     	x.string :post
  		x.string :user_id
      x.timestamps  null: false
    end
    
  end
end
