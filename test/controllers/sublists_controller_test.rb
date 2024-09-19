require "test_helper"

class SublistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sublists_create_url
    assert_response :success
  end

  test "should get new" do
    get sublists_new_url
    assert_response :success
  end

  test "should get destroy" do
    get sublists_destroy_url
    assert_response :success
  end

  test "should get update" do
    get sublists_update_url
    assert_response :success
  end
end
