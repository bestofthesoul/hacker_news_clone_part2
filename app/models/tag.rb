class Tag < ActiveRecord::Base
  has_many :posttags
  has_many :posts, through: :posttags

   validates :name, :presence => true, :uniqueness => true
end