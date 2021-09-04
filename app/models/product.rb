class Product < ApplicationRecord
  
  # FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged

  # validations
  validates_presence_of [:name, :price]

  # mounts
  mount_uploaders :images, ProductImagesUploader

  # associations
  belongs_to :user
  belongs_to :category

  # custom callbacks
  after_initialize :set_default_status, :if => :new_record?
  after_initialize :set_cover, :if => :new_record?

  # enumerables
  enum status: [:selling, :sold, :removed]

  def should_generate_new_friendly_id?
    name_changed?
  end

  def set_cover
    self.cover = self.images.first
  end

  def set_default_status
    self.status ||= :selling
  end
end
