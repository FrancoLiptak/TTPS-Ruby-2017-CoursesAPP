# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@admin.com', password: 123456)

Course.create year: Time.zone.today.year
Course.create year: (Time.zone.today.year - 1)

Course.all.each do |course|
  3.times do |i|
    EvaluationInstance.create(course: course,
                              title: "Instance #{i + 1}", 
                              passing_score: rand(40..60), 
                              top_score: rand(40..100),  
                              date: Time.at(rand((Time.new(course.year, 1, 1))..(Time.new(course.year, 12, 31))))
                              )
  end
end

10.times do |i|
  offset = rand(Course.count)
  course = Course.offset(offset).first
  name = Faker::GameOfThrones.character
  split_name = name.split(/\W+/)
  email = name.delete(' ') + '@gmail.com'
  Student.create( name: split_name.first, 
                  last_name: split_name.last,
                  course: course, 
                  dni: rand(35000000..40000000),
                  email: email, 
                  student_number: "#{ rand(12000..15000) }/#{ rand(1..10) }"
                )
end
  
EvaluationInstance.all.each do |instance|
  10.times do
    instance.scores.build(score: rand(0..100), evaluation_instance: instance, student: (instance.course.students).sample )
    instance.save
  end
end