

class CreatePosttags < ActiveRecord::Migration
  def change

    create_table  :posttags do |x|
	x.integer :post_id
	x.integer :tag_id

      x.timestamps  null: false
    end
  end
end
