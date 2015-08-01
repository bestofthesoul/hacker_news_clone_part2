

class CreateTags < ActiveRecord::Migration
  def change

    create_table  :tags do |x|

      x.string  :name

      x.timestamps  null: false
    end
  end
end
