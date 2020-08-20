class Help < ApplicationRecord
  belongs_to :nurse, class_name: 'User'
  belongs_to :leader, class_name: 'User'
end
