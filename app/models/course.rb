class Course < ActiveRecord::Base
  validates :name, presence: true
  validates :prereq_id, :instructor_id,
  presence: true, numericality: { only_integer: true }

  has_many :enrollments,
  class_name: "Enrollment",
  foreign_key: :course_id,
  primary_key: :id

  has_many :next_course,
  class_name: "Course",
  foreign_key: :prereq_id,
  primary_key: :id

  belongs_to :preprequitsite,
  class_name: "Course",
  foreign_key: :prereq_id,
  primary_key: :id

  belongs_to :instructor,
  class_name: "User",
  foreign_key: :instructor_id,
  primary_key: :id

  has_many :students, through: :enrollments, source: :student

end
