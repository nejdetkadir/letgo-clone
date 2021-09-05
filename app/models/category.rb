class Category < ApplicationRecord

  # FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged

  # scopes
  scope :active, -> { where(is_public: true)}

  # associations
  has_many :products, dependent: :destroy

  # validations
  validates_presence_of [:name, :icon, :color]

  def should_generate_new_friendly_id?
    name_changed?
  end

  def as_json(*_args)
    {
      id: id,
      name: name,
      color: color,
      icon: icon,
      slug: slug
    }
  end
end
