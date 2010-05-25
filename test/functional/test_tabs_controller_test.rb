require 'test_helper'

class TestTabsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_tabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_tab" do
    assert_difference('TestTab.count') do
      post :create, :test_tab => { }
    end

    assert_redirected_to test_tab_path(assigns(:test_tab))
  end

  test "should show test_tab" do
    get :show, :id => test_tabs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test_tabs(:one).to_param
    assert_response :success
  end

  test "should update test_tab" do
    put :update, :id => test_tabs(:one).to_param, :test_tab => { }
    assert_redirected_to test_tab_path(assigns(:test_tab))
  end

  test "should destroy test_tab" do
    assert_difference('TestTab.count', -1) do
      delete :destroy, :id => test_tabs(:one).to_param
    end

    assert_redirected_to test_tabs_path
  end
end
