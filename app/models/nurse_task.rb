class NurseTask < ApplicationRecord
  belongs_to :user
  belongs_to :helper
  belongs_to :task_template
  validates :task_template, :user, presence: true
end
