class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, :description, :note, presence: true
end
