class Restaurant < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :customers, through: :reviews
  has_many :reviews

  validates :name, presence: true
  validates :cuisine, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def average_rating
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    return total / self.reviews.length
  end
end
