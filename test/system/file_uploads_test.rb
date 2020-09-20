require "application_system_test_case"

class FileUploadsTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit root_path
     assert_selector "h2", text: "Letter Legal Page Separator"
   end
end
