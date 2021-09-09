class District < ApplicationRecord
  # associations
  belongs_to :town

  # validations
  validates :name, presence: true, uniqueness: { scope: %i[town_id] }
end
