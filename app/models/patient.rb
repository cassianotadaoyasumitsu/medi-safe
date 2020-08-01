class Patient < ApplicationRecord
  EMERGENCY = ['Low Care', 'Medium Care', 'High Care']
  belongs_to :user
  belongs_to :doctor
  validates :name, :gender, :age, :room, :bed, :severity, presence: true
  validates :user_id, :task_id, :doctor_id, presence: true
  validates :severity, uniqueness: { scope: EMERGENCY }
end
