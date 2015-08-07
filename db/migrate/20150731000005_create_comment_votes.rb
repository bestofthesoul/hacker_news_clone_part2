
class CreateCommentVotes < ActiveRecord::Migration
  def change

    create_table  :comment_votes do |x|
		x.integer  :comment_id
		x.integer  :user_id
		x.timestamps  null: false
    end
    
  end
end

