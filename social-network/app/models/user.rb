class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy #destroys the posts when the user is deleted
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
 
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  
  def feed
    Post.where("user_id = ?", id)
  end
end
