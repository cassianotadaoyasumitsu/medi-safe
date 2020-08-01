class Task < ApplicationRecord
  has_many :task_templates
  validates :description, :duration, presence: true
end
