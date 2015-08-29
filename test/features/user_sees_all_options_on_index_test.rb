# require_relative "../test_helper"

# class UserSeesAllOptionsOnIndexTest < FeatureTest

#   def test_user_sees_robot_headquarters_on_index_page
#     visit "/robots"
#     within("#robot_headquarters") do
#       assert page.has_content?("Robot Headquarters")
#     end
#   end

#   def test_user_can_navigate_to_robot_world_from_index_page
#     visit "/robots"
#     click_link "Return to Robot World"
#     assert_equal "/", current_path
#   end

#   def test_user_can_navigate_to_new_robot_form_from_index_page
#     visit "/robots"
#     click_link "Add a New Robot"
#     assert_equal "/robots/new", current_path
#   end
# end