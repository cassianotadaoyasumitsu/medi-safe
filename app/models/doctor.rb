class Doctor < ApplicationRecord
  has_many :patients
  validates :name, :contact, :specialty, presence: true
end
