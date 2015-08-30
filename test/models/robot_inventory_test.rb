require_relative '../test_helper'

class RobotInventoryTest < Minitest::Test

  def setup
    @attributes        = {:name=>"R Daneel",
                          :city=> "Auroa",
                          :state => "Virginia",
                          :birthdate=> 21888,
                          :date_hired=> 21888,
                          :department=> "science"}
    @attributes_two    = {:name=>"R Daneel 2",
                          :city=> "Auroa 2",
                          :state => "Colorado",
                          :birthdate=> 21889,
                          :date_hired=> 21889,
                          :department=> "science 2"}
    @attributes_three  = {:name=>"R Daneel 3",
                          :city=> "Auroa 3",
                          :state => "New Jersey",
                          :birthdate=> 21990,
                          :date_hired=> 21990,
                          :department=> "science 3"}

    @robot_1 = RobotInventory.create(@attributes)
    @robot_2 = RobotInventory.create(@attributes_two)
    @robot_3 = RobotInventory.create(@attributes_three)
  end

  def test_it_displays_all_robots
    robot =  RobotInventory.all
    assert_equal 3, robot.count
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