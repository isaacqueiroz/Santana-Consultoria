require 'test_helper'

class AllowTestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allow_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allow_test" do
    assert_difference('AllowTest.count') do
      post :create, :allow_test => { }
    end

    assert_redirected_to allow_test_path(assigns(:allow_test))
  end

  test "should show allow_test" do
    get :show, :id => allow_tests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => allow_tests(:one).to_param
    assert_response :success
  end

  test "should update allow_test" do
    put :update, :id => allow_tests(:one).to_param, :allow_test => { }
    assert_redirected_to allow_test_path(assigns(:allow_test))
  end

  test "should destroy allow_test" do
    assert_difference('AllowTest.count', -1) do
      delete :destroy, :id => allow_tests(:one).to_param
    end

    assert_redirected_to allow_tests_path
  end
end
