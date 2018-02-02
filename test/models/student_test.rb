require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  # --- Test for validations ---

  test "name cant be nil" do 
    student = students(:one)
    student.name = nil 
    assert_not student.valid?
  end

  test "last name cant be nil" do 
    student = students(:one)
    student.last_name = nil 
    assert_not student.valid?
  end

  test "dni cant be nil" do 
    student = students(:one)
    student.dni = nil 
    assert_not student.valid?
  end

  test "student number cant be nil" do 
    student = students(:one)
    student.student_number = nil 
    assert_not student.valid?
  end

  test "email cant be nil" do 
    student = students(:one)
    student.email = nil 
    assert_not student.valid?
  end

  test "email must have correct format" do 
    student = students(:one)
    student.email = 'goku'
    assert_not student.valid?
  end
  
  test "dni must be unique in a course" do 
    student = students(:one)
    another_student = students(:two)
    student.dni = another_student.dni
    student.course = another_student.course   
    assert_not student.valid?
  end 

  test "student number must be unique in a course" do 
    student = students(:one)
    another_student = students(:two)
    student.student_number = another_student.student_number
    student.course = another_student.course
    assert_not student.valid?
  end

  test "this student must be created" do 
    student = students(:one)
    assert student.valid?
  end 

  # --- Tests for methods --- 

  test "the summary must be equal" do 
    student = students(:one)
    assert_equal("Liptak Franco - 12345/5", student.summary)
  end

  test "the student must know if he has results associated or not" do 
    student = students(:one)
    evaluation = evaluation_instances(:one)
    assert (student.you_already_have_score? evaluation)

    another_student = student.course.students.build(course: courses(:one), last_name: "Brost", name: "Pepe", dni: 38659423, student_number: 56564/5, email: "pepo.brost@gmail.com")
    assert_not (another_student.you_already_have_score? evaluation)
  end
end
