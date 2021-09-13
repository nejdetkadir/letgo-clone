class Conversation < ApplicationRecord
  # associations
  belongs_to :product
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  has_many :messages

  # validations
  validates :from_id, uniqueness: { scope: %i[product_id to_id] }

  # custom callbacks
  after_create :send_notify

  private

  def send_notify
    puts "send_notify triggered"
  end
end
