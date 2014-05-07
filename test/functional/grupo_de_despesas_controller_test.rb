require 'test_helper'

class GrupoDeDespesasControllerTest < ActionController::TestCase
  setup do
    @grupo_de_despesa = grupo_de_despesas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupo_de_despesas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupo_de_despesa" do
    assert_difference('GrupoDeDespesa.count') do
      post :create, grupo_de_despesa: { data_das_despesas: @grupo_de_despesa.data_das_despesas, descricao: @grupo_de_despesa.descricao }
    end

    assert_redirected_to grupo_de_despesa_path(assigns(:grupo_de_despesa))
  end

  test "should show grupo_de_despesa" do
    get :show, id: @grupo_de_despesa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupo_de_despesa
    assert_response :success
  end

  test "should update grupo_de_despesa" do
    put :update, id: @grupo_de_despesa, grupo_de_despesa: { data_das_despesas: @grupo_de_despesa.data_das_despesas, descricao: @grupo_de_despesa.descricao }
    assert_redirected_to grupo_de_despesa_path(assigns(:grupo_de_despesa))
  end

  test "should destroy grupo_de_despesa" do
    assert_difference('GrupoDeDespesa.count', -1) do
      delete :destroy, id: @grupo_de_despesa
    end

    assert_redirected_to grupo_de_despesas_path
  end
end
