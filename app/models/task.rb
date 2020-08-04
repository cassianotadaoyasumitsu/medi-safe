class Task < ApplicationRecord
  has_many :task_templates, dependent: :destroy
  validates :description, :duration, presence: true
end
