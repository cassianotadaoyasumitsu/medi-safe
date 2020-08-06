class TaskTemplate < ApplicationRecord
  belongs_to :task
  belongs_to :patient
  has_many :nurse_tasks
end
