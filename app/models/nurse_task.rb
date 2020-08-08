class NurseTask < ApplicationRecord
  SLOTS = [0, 4, 8, 12, 16, 20]
  belongs_to :user
  belongs_to :helper, required: false, class_name: 'User'
  belongs_to :task_template
  validates :task_template, :user, presence: true
  validates :slot, presence: true, inclusion: { in: SLOTS }
end
