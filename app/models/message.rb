class Message < ApplicationRecord
  # associations
  belongs_to :conversation
  belongs_to :user

  # mounts
  mount_uploader :image, MessageImageUploader
end
