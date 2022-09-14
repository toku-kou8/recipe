class Menu < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :genre
  validates :difficulty, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  enum authority: {allcustomer: 0, follow: 1, me: 2}
end
