class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :menus, dependent: :destroy
  enum sex: {man: 0,wemen:1}
  enum profession: {wife: 0, employee: 1, student: 2, part: 3}

  def self.ransackable_attributes(auth_object = nil)
    ["age", "city", "created_at", "email", "encrypted_password", "id", "name",
    "postal_code", "prefecture_code", "profession", "sex", "street", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["menus"]
  end
end
