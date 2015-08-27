require_relative '../test_helper'

class RobotInventoryTest < Minitest::Test

  def setup
    attributes        = {:id=>1, :name=>"R Daneel", :city=> "Auroa", :avatar=> "TBD", :birthdate=> "021888 ", :date_hired=> "021880", :department=> "science"}
    attributes_two    = {:id=>2, :name=>"R Daneel 2", :city=> "Auroa 2", :avatar=> "TBD 2", :birthdate=> "021888 2", :date_hired=> "021880 2", :department=> "science 2"}
    attributes_three  = {:id=>3, :name=>"R Daneel 3", :city=> "Auroa 3", :avatar=> "TBD 3", :birthdate=> "021888 3", :date_hired=> "021880 3", :department=> "science 3"}
    RobotInventory.create(attributes)
    RobotInventory.create(attributes_two)
    RobotInventory.create(attributes_three)
  end

  def test_it_creates_a_robot
    robot = RobotInventory.find(1)
    assert_equal 1, robot.id
    assert_equal "R Daneel", robot.name
  end

  def test_it_displays_all_robots
    robot =  RobotInventory.all
    assert_equal 3, robot.count
  end

  def test_it_finds_robot_by_id
    robot = RobotInventory.find(2)
    assert_equal "R Daneel 2", robot.name
  end

  def test_it_can_update_a_robot
    robot = RobotInventory.update(2, {:id=>2, :name=>"R Daneel 2", :city=> "Auroa 2", :avatar=> "TBD 2", :birthdate=> "021888 2", :date_hired=> "021880 2", :department=> "science 3"})
    robot_1 = RobotInventory.find(2)
    assert_equal "science 3", robot_1.department
  end

  def test_it_can_delete_a_robot
    robot = RobotInventory.delete(3)
    assert_equal 2, robot.count
  end

  def test_it_can_delete_all_robots
    assert_equal 3, RobotInventory.all.count
    robot = RobotInventory.delete_all
    assert_equal 0, RobotInventory.all.count
  end
end