class NurseTask < ApplicationRecord
  validates :task_template, :user, presence: true
end
