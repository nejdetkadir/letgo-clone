class City < ApplicationRecord
  # associations
  has_many :towns, dependent: :destroy

  # validations
  validates_presence_of [:name, :alpha_2_code]
  validates_uniqueness_of [:name, :alpha_2_code]
end
