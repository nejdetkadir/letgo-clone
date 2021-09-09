class Quarter < ApplicationRecord
  # associations
  belongs_to :district

  # validations
  validates :name, presence: true, uniqueness: { scope: %i[district_id] }
end
