class Course < ApplicationRecord
  validates :short_name, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
end
