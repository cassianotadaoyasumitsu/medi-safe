class Task < ApplicationRecord
  has_many :task_templates
  validates :user_id, :description, :note, presence: true
end
