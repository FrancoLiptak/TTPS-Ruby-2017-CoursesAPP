class Course < ApplicationRecord
    has_many :students
    has_many :evaluation_instances
end
