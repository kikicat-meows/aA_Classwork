# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :integer
#  prereq_id     :integer
#

class Course < ApplicationRecord
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment
    
  has_many :enrolled_students, through: :enrollments, source: :user

  has_many :secondary_courses,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  belongs_to :prereq,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User
end

# class Employee < ApplicationRecord
#   has_many :subordinates,
#     class_name: 'Employee',
#     foreign_key: :manager_id,
#     primary_key: :id

#   belongs_to :manager,
#     class_name: 'Employee',
#     foreign_key: :manager_id,
#     primary_key: :id
# end
