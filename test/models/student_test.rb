require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

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
end
