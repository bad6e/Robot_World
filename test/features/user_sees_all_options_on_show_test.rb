# require_relative "../test_helper"

# class UserSeesAllOptionsOnShowTest < FeatureTest

#   def test_user_can_navigate_to_robot_inventory_from_show_page
#     visit "/"
#     click_link "Add a New Robot"
#     fill_in "robot[name]", with: "R Daneel"
#     fill_in "robot[city]", with: "Auroa"
#     fill_in "robot[state]", with: "Virginia"
#     fill_in "robot[birthdate]", with: "021888"
#     fill_in "robot[date_hired]", with: "021880"
#     fill_in "robot[department]", with: "science"
#     click_button "Submit"
#     assert_equal "/robots", current_path

#     visit "/robots/1"
#     click_link "Robot Inventory"
#     assert_equal "/robots", current_path
#   end
# end