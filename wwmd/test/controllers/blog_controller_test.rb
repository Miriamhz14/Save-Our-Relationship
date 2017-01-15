require 'test_helper'

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog_index_url
    assert_response :success
  end

  test "should get home" do
    get blog_home_url
    assert_response :success
  end

  test "should get profile" do
    get blog_profile_url
    assert_response :success
  end

end
