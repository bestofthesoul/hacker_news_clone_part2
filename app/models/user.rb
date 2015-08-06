class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

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

