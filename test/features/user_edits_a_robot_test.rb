require_relative "../test_helper"

class UserEditsARobotTest < FeatureTest

 def test_user_can_edit_a_robot
    #This creates a robot
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

    #This edits a robot
    click_link "Edit"
    fill_in "robot[name]", with: "R Daneel 2"
    click_button "Submit"
    within("#robot_name_show") do
      assert page.has_content?("R Daneel 2")
    end
  end
end