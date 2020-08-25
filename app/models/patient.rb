class Patient < ApplicationRecord
  EMERGENCY = ['Low Care', 'Medium Care', 'High Care']
  belongs_to :doctor
  has_many :task_templates
  has_many :nurse_tasks, through: :task_templates
  validates :name, :gender, :age, :room, :bed, presence: true
  validates :doctor_id, presence: true
  validates :severity, :inclusion=> { in: EMERGENCY }

  def priority
   result = {'Low Care' => 3, 'Medium Care' => 2, 'High Care' => 1}
   result[self.severity]
  end
end
