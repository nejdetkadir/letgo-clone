class District < ApplicationRecord
  # associations
  belongs_to :town
  has_many :quarters, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: { scope: %i[town_id] }
end
