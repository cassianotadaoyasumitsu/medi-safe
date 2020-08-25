class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  # This allows notifiable to accept multiple different classes
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
end
