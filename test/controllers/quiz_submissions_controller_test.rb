require "test_helper"

class QuizSubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get quiz_submissions_create_url
    assert_response :success
  end
end
