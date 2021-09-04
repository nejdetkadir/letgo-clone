class Category < ApplicationRecord

  # FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged

  # scopes
  scope :active, -> { where(is_public: true)}

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
