class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  belongs_to :leader, required: false, class_name: 'User'
  has_many :nurses, class_name: 'User', foreign_key: 'leader_id'
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :nurse_tasks, dependent: :destroy
  has_many :task_templates, through: :nurse_tasks
  has_many :patients, through: :task_templates
end
