class CreateComments < ActiveRecord::Migration
  def change

    create_table  :comments do |x|
		x.integer :user_id
		x.integer :post_id
		x.string :comment
		x.timestamps  null: false
    end
    
  end
end
