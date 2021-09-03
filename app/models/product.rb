class Product < ApplicationRecord
  # validations
  validates_presence_of [:name, :price, :cover]

  # mounts
  mount_uploaders :images, ProductImagesUploader

  # associations
  belongs_to :user

  # custom callbacks
  after_initialize :set_default_status, :if => :new_record?

  # enumerables
  enum status: [:selling, :sold, :removed]

  def set_default_status
    self.status ||= :published
  end
end
