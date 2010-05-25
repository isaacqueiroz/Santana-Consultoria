require 'test_helper'

class QuestionTabsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_tabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_tab" do
    assert_difference('QuestionTab.count') do
      post :create, :question_tab => { }
    end

    assert_redirected_to question_tab_path(assigns(:question_tab))
  end

  test "should show question_tab" do
    get :show, :id => question_tabs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => question_tabs(:one).to_param
    assert_response :success
  end

  test "should update question_tab" do
    put :update, :id => question_tabs(:one).to_param, :question_tab => { }
    assert_redirected_to question_tab_path(assigns(:question_tab))
  end

  test "should destroy question_tab" do
    assert_difference('QuestionTab.count', -1) do
      delete :destroy, :id => question_tabs(:one).to_param
    end

    assert_redirected_to question_tabs_path
  end
end
