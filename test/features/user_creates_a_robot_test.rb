require_relative "../test_helper"

class UserCreatesARobotTest < FeatureTest

  def test_user_can_create_a_robot
    visit "/"
    click_link "Add a New Robot"
    assert_equal "/robots/new", current_path
    fill_in "robot[name]", with: "R Daneel"
    fill_in "robot[city]", with: "Auroa"
    fill_in "robot[state]", with: "Virginia"
    fill_in "robot[birthdate]", with: '2015-08-12'
    fill_in "robot[date_hired]", with: '2015-08-12'
    select  'Human Studies', from: 'robot[department]'
    click_button "Submit"
    assert_equal "/robots", current_path
    within("#robot_description") do
      assert page.has_content?("R Daneel")
    end
  end
end