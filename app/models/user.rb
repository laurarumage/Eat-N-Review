class User < ActiveRecord::Base
  has_many :created_restaurants, class_name: :Restaurant, foreign_key: :creator_id
  has_many :reviews, foreign_key: :customer_id
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  require 'bcrypt'

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end

  def reviewed?(restaurant)
    self.reviewed_restaurants.include?(restaurant)
  end

end
