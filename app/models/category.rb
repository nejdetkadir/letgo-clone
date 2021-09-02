class Category < ApplicationRecord

  # FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged

  # scopes
  scope :active, -> { where(is_public: true)}

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
