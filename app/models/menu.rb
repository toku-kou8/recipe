class Menu < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :genre
  has_many :menu_details, dependent: :destroy

  acts_as_taggable #acts_as_taggable_on :tags の省略
  # acts_as_taggable_on :tags
  # scope :by_join_date, order("created_at DESC")
  validates :difficulty, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  enum authority: {allcustomer: 0, follow: 1, me: 2}

  accepts_nested_attributes_for :menu_details, allow_destroy: true, reject_if: :all_blank

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.ransackable_attributes(auth_object = nil)
    ["authority", "calorie", "created_at", "customer_id", "difficulty",
    "genre_id", "id", "impression", "name", "number", "price", "profession",
    "time", "updated_at", "way"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["customer", "genre", "image_attachment", "image_blob", "menu_details"]
  end
end
