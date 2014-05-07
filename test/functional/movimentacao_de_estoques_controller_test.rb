require 'test_helper'

class MovimentacaoDeEstoquesControllerTest < ActionController::TestCase
  setup do
    @movimentacao_de_estoque = movimentacao_de_estoques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movimentacao_de_estoques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movimentacao_de_estoque" do
    assert_difference('MovimentacaoDeEstoque.count') do
      post :create, movimentacao_de_estoque: { dataDaMovimentacao: @movimentacao_de_estoque.dataDaMovimentacao, observacoes: @movimentacao_de_estoque.observacoes, quantidade: @movimentacao_de_estoque.quantidade }
    end

    assert_redirected_to movimentacao_de_estoque_path(assigns(:movimentacao_de_estoque))
  end

  test "should show movimentacao_de_estoque" do
    get :show, id: @movimentacao_de_estoque
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movimentacao_de_estoque
    assert_response :success
  end

  test "should update movimentacao_de_estoque" do
    put :update, id: @movimentacao_de_estoque, movimentacao_de_estoque: { dataDaMovimentacao: @movimentacao_de_estoque.dataDaMovimentacao, observacoes: @movimentacao_de_estoque.observacoes, quantidade: @movimentacao_de_estoque.quantidade }
    assert_redirected_to movimentacao_de_estoque_path(assigns(:movimentacao_de_estoque))
  end

  test "should destroy movimentacao_de_estoque" do
    assert_difference('MovimentacaoDeEstoque.count', -1) do
      delete :destroy, id: @movimentacao_de_estoque
    end

    assert_redirected_to movimentacao_de_estoques_path
  end
end
