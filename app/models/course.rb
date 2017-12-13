class Course < ApplicationRecord
    has_many :students
    has_many :evaluation_instances
    has_many :scores

    validates :year, presence: true, uniqueness: true,
                    format: { with: /(20)\d{2}/i, message: "the year should have 4 digits" },
                    inclusion: { in: 2010..Date.today.year, message: "the year must be between 2010 and current" }
end
