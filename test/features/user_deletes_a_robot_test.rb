require_relative "../test_helper"

class UserEditsARobotTest < FeatureTest

 def test_user_can_delete_a_task
    visit "/"
    click_link "Add a New Robot"
    fill_in "robot[name]", with: "R Daneel"
    fill_in "robot[city]", with: "Auroa"
    fill_in "robot[state]", with: "Virginia"
    fill_in "robot[birthdate]", with: "021888"
    fill_in "robot[date_hired]", with: "021880"
    fill_in "robot[department]", with: "science"
    click_button "Submit"
    click_button'Delete'
    assert_equal '/robots', current_path
  end
end