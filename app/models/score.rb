class Score < ApplicationRecord
  belongs_to :evaluation_instance
  belongs_to :student
end
