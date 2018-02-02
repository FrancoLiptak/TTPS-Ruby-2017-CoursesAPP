require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "the result must belong to a student" do 
    score = scores(:one)
    score.student = nil 
    assert_not score.valid?
  end


  test "the result must belong to a asd" do 
    score = scores(:one)
    assert_not score.evaluation_instance = nil
  end

  test "the result must be bigger than 0" do 
    score = scores(:one)
    score.score = -80 
    assert_not score.valid?
  end

  test 'this score must be created' do
    score = scores(:one)
    assert score.valid?
  end

end
