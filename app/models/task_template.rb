class TaskTemplate < ApplicationRecord
  belongs_to :task
  belongs_to :patient
end
