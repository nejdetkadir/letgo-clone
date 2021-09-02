class Category < ApplicationRecord

  # scopes
  scope :active, -> { where(is_public: true)}
end
