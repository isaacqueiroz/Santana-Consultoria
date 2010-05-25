require 'test_helper'

class CurriculosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curriculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curriculo" do
    assert_difference('Curriculo.count') do
      post :create, :curriculo => { }
    end

    assert_redirected_to curriculo_path(assigns(:curriculo))
  end

  test "should show curriculo" do
    get :show, :id => curriculos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => curriculos(:one).to_param
    assert_response :success
  end

  test "should update curriculo" do
    put :update, :id => curriculos(:one).to_param, :curriculo => { }
    assert_redirected_to curriculo_path(assigns(:curriculo))
  end

  test "should destroy curriculo" do
    assert_difference('Curriculo.count', -1) do
      delete :destroy, :id => curriculos(:one).to_param
    end

    assert_redirected_to curriculos_path
  end
end
