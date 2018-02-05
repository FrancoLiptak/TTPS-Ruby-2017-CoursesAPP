require 'test_helper'

class StudentTest < ActiveSupport::TestCase

                            # 1 assert for test.

  # --- Test for validations ---

  test "some attributes cant be nil (name, last name, dni, student number, email)" do 
    assert_not Student.new.valid?
  end

  test "email must have correct format" do
    assert_not Student.new(course: courses(:one), last_name: 'Son', name: 'Goku', dni: 30234923, student_number: 12367/6, email: 'goku').valid?
  end

  # Test for unniquess
  
  test "dni must be unique in a course" do
    assert_not Student.new(course: courses(:one), last_name: 'Son', name: 'Goku', dni: students(:one).dni, student_number: 45632/8, email: 'goku@saiyajin.com').valid?
  end 

  test "student number must be unique in a course" do 
    assert_not Student.new(course: courses(:one), last_name: 'Son', name: 'Goku', dni: 30234923, student_number: students(:one).student_number, email: 'goku@saiyajin.com').valid?
  end

  # --- Tests for methods --- 

  test "the summary must be equal" do 
    assert_equal("Liptak Franco - 12345/5", students(:one).summary)
  end

  test "the student must know if he has results associated or not, in this case yes" do # CAMBIAR POR METODO USADO
    assert (students(:one).you_already_have_score? evaluation_instances(:one))
  end

  test "the student must know if he has results associated or not, in this case no" do # CAMBIAR POR METODO USADO
    student = Student.new(course: courses(:one), last_name: 'Son', name: 'Goku', dni: 34567891, student_number: 45632/8, email: 'goku@saiyajin.com')
    assert_not (student.you_already_have_score? evaluation_instances(:one))
  end
end
