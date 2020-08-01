class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  belongs_to :leader, required: false, class_name: 'User'
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :nurse_tasks, dependent: :destroy
end
