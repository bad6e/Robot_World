require_relative "../test_helper"

class UserSeesAllOptionsOnDashBoardTest < FeatureTest

  def test_it_says_welcome_on_landing_page
    visit "/"
    within("#greeting") do
      assert page.has_content?("Welcome to Robot World")
    end
  end

  def test_user_can_navigate_to_a_list_of_robots
    visit "/"
    click_link "List of Robots"
    assert_equal "/robots", current_path
  end

  def test_user_can_navigate_to_a_new_robot_form
    visit "/"
    click_link "Add a New Robot"
    assert_equal "/robots/new", current_path
  end
end

