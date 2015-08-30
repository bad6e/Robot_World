require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_it_assigns_the_proper_attributes
    attributes = {:name=>"R Daneel",
                 :city=> "Auroa",
                 :state => "Virginia",
                 :birthdate=> 21888,
                 :date_hired=> 21888,
                 :department=> "science"}
    robot = Robot.new(attributes)

    assert_equal "R Daneel", robot.name
    assert_equal "Auroa", robot.city
    assert_equal "Virginia", robot.state
    assert_equal 21888, robot.birthdate
    assert_equal 21888, robot.date_hired
    assert_equal "science", robot.department
  end
end