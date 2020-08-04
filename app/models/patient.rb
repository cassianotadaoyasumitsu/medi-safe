class Patient < ApplicationRecord
  EMERGENCY = ['Low Care', 'Medium Care', 'High Care']
  belongs_to :doctor
  has_many :task_templates
  validates :name, :gender, :age, :room, :bed, presence: true
  validates :doctor_id, presence: true
  validates :severity, :inclusion=> { in: EMERGENCY }
end
