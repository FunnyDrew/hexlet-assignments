require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
   test "the index" do
     get '/tasks'
     assert_response :success
     assert_equal flash[:success], 'Everything is allright'
   end

   test "should create article" do
      assert_difference("Task.count") do
        post tasks_url, params: { task: { name: "Game", creator:"Some3"  } }
      end
      assert_redirected_to task_path(Task.last)
    end

    test 'new_controller' do
      get new_task_path
      assert_response :success
    end

    test 'post_controller' do
      assert_difference("Task.count") do
        post tasks_path, params: { task: { name: "New Task", creator:"Andrew"  } }
      end
      assert_redirected_to task_path(Task.last)
      assert_equal flash[:success], 'New task successfuly created'
    end

    test 'post_controller_with invalid params' do
      assert_no_difference 'Task.count' do
        post tasks_path, params: { task: { name: nil, creator:"Andrew"  } }
      end
      
      assert_equal flash[:failure], 'Task cannot be created'
      assert_response :success
    end
 end