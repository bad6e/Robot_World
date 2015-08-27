require_relative "../test_helper"

class UserCreatesARobotTest < FeatureTest

  def test_user_can_create_a_robot
    visit "/"
    click_link "Add a New Robot"
    fill_in "robot[name]", with: "R Daneel"
    fill_in "robot[city]", with: "Auroa"
    fill_in "robot[state]", with: "Virginia"
    fill_in "robot[birthdate]", with: "021888"
    fill_in "robot[date_hired]", with: "021880"
    fill_in "robot[department]", with: "science"
    click_button "Submit"
    assert_equal "/robots", current_path
  end
end