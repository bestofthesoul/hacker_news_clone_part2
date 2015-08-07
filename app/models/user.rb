class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :post_votes
  has_many :comment_votes

  validates :email, presence: true, uniqueness: true  
  validates :email, :format => { :with => /[a-z]*@[a-z]*.[a-z]{2,}/, :message => "error"}
  
  validates :password, presence: true


  def check_password(password)
    if self.password == password
      true
    else
      false
    end
  end

end

