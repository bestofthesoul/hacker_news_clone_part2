
class CreatePostVotes < ActiveRecord::Migration
  def change

    create_table  :post_votes do |x|
		x.integer  :post_id
		x.integer  :user_id
		x.timestamps  null: false
    end
    
  end
end

