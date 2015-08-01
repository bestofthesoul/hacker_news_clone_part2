class Post < ActiveRecord::Base
  has_many :posttags
  has_many :tags, through: :posttags
  

  validates :title, :content,  :presence => true
  # def self.idreset
  #    a= Post.all
  #    a.each_with_index do|x, index|
  #      x.update(id: index+1)
  #    end
  # end

end