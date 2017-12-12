json.extract! courses_evaluation_instance, :id, :title, :date, :passing_core, :created_at, :updated_at
json.url courses_evaluation_instance_url(courses_evaluation_instance, format: :json)
