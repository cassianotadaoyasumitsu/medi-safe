class NurseTask < ApplicationRecord
  belongs_to :user
  belongs_to :helper, required: false, class_name: 'User'
  belongs_to :task_template
  validates :task_template, :user, presence: true
end
