require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_it_assigns_the_proper_attributes
    attributes = {"id"=>1, "name"=>"R Daneel", "city"=> "Auroa","avatar"=> "TBD","birthdate"=> "021888","date_hired"=> "021880","department"=> "science"}
    robot = Robot.new(attributes)

    assert_equal 1, robot.id
    assert_equal "R Daneel", robot.name
    assert_equal "Auroa", robot.city
    assert_equal "TBD", robot.avatar
    assert_equal "021888", robot.birthdate
    assert_equal "021880", robot.date_hired
    assert_equal "science", robot.department
  end
end