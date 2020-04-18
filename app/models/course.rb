class Course < ApplicationRecord
  validates :short_name, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses
end
