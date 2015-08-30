require_relative '../test_helper'

class RobotInventoryTest < Minitest::Test

  def setup
    @attributes        = {:name=>"R Daneel",
                          :city=> "Auroa",
                          :state => "Virginia",
                          :birthdate=> '2000-08-12',
                          :date_hired=> '2015-08-12',
                          :department=> "science"}
    @attributes_two    = {:name=>"R Daneel 2",
                          :city=> "Auroa 2",
                          :state => "Colorado",
                          :birthdate=> '2001-08-12',
                          :date_hired=> '2015-08-12',
                          :department=> "science 2"}
    @attributes_three  = {:name=>"R Daneel 3",
                          :city=> "Auroa 3",
                          :state => "New Jersey",
                          :birthdate=> '2003-08-12',
                          :date_hired=> '2015-08-12',
                          :department=> "science 3"}

    @robot_1 = RobotInventory.create(@attributes)
    @robot_2 = RobotInventory.create(@attributes_two)
    @robot_3 = RobotInventory.create(@attributes_three)
  end

  def test_it_displays_all_robots
    robot =  RobotInventory.all
    assert_equal 3, robot.count
  end

  def test_it_can_find_a_robots_age
    assert_equal 15, RobotInventory.age(@robot_1.id)
  end

  def test_it_can_find_the_average_age_of_robots
    assert_equal 13, RobotInventory.average_age
  end

  def test_it_finds_robot_by_id
    robot = RobotInventory.find(@robot_1.id)
    assert_equal "R Daneel", robot.name
  end

  def test_it_can_update_a_robot
    robot = RobotInventory.update(@robot_1.id, @attributes_two)
    updated_robot = RobotInventory.find(@robot_1.id)
    assert_equal "R Daneel 2", updated_robot.name
  end

  def test_it_can_delete_a_robot
    robot = RobotInventory.delete(@robot_1.id)
    assert_equal 2, RobotInventory.all.count
  end

  def test_it_can_delete_all_robots
    assert_equal 3, RobotInventory.all.count
    robot = RobotInventory.delete_all
    assert_equal 0, RobotInventory.all.count
  end
end