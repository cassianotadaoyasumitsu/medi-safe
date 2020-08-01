class Doctor < ApplicationRecord
  validates :name, :contact, :specialty, presence: true
end
