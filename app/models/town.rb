class Town < ApplicationRecord
  # associations
  belongs_to :city
  has_many :districts, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: { scope: %i[city_id] }
end
