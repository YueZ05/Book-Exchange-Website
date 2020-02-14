require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "SYSBM's OSU Book Exchange"
  end

  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign Up | SYSBM's OSU Book Exchange"
  end

end
