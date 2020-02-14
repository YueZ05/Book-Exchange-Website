class User < ApplicationRecord

  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[a-z\-]+\.\d+@osu\.edu/x
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  Password_Requirements = /\A
   (?=.*\d)
   (?=.*[a-z])
   (?=.*[A-Z])
   (?=.*[[:^alnum:]])
    /x

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, format: Password_Requirements
  has_many :books, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest (used to encrypt the password) of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

 # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest. False if it doesn't and if the digest is nil.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end



  def feed
    following_ids = "SELECT followed_id FROM relationships
                         WHERE  follower_id = :user_id"

    Book.where("user_id IN (:following_ids) OR user_id = :user_id",
               following_ids: following_ids, user_id: id)

  end
  # follow others
  def follow(other_user)
    following << other_user
  end
  # unfollow 
  def unfollow(other_user)
    following.delete(other_user)
  end
  # if follow then true
  def following?(other_user)
    following.include?(other_user)
  end

  private

end
