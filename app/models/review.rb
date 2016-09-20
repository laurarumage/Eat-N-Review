class Review < ActiveRecord::Base
  belongs_to :customer, class_name: :User
  belongs_to :restaurant

  validates :customer_id, presence: true
  validates :restaurant_id, presence: true
  validates :rating, presence: true
  validates :body, presence: true
end
