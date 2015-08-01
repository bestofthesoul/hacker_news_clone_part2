

class CreatePosts < ActiveRecord::Migration
  def change

    create_table  :posts do |x|

      x.string  :title
      x.string  :content
      x.timestamps  null: false
    end
  end
end
