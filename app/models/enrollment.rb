class Enrollment < ActiveRecord::Base
  validates :student_id, :course_id,
  :presence => true, numericality: { only_integer: true }


  belongs_to :student,
  class_name: "User",
  foreign_key: :student_id,
  primary_key: :id

  belongs_to :course,
  class_name: "Course",
  foreign_key: :course_id,
  primary_key: :id

end
