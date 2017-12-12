json.extract! courses_student, :id, :last_name, :name, :dni, :student_number, :email, :created_at, :updated_at
json.url courses_student_url(courses_student, format: :json)
