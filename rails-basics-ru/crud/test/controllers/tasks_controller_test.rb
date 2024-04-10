require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
   test "the index" do
     get root_path
     debugger
     assertion :sucess
   end
end
