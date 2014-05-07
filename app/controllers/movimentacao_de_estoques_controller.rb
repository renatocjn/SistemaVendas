class MovimentacaoDeEstoquesController < ApplicationController
  # GET /movimentacao_de_estoques
  # GET /movimentacao_de_estoques.json
  def index
	  @movimentacao_de_estoques = MovimentacaoDeEstoque.order(:dataDaMovimentacao)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movimentacao_de_estoques }
    end
  end

  # GET /movimentacao_de_estoques/1
  # GET /movimentacao_de_estoques/1.json
  def show
    @movimentacao_de_estoque = MovimentacaoDeEstoque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movimentacao_de_estoque }
    end
  end

  # GET /movimentacao_de_estoques/new
  # GET /movimentacao_de_estoques/new.json
  def new
    @movimentacao_de_estoque = MovimentacaoDeEstoque.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movimentacao_de_estoque }
    end
  end

  # GET /movimentacao_de_estoques/1/edit
  def edit
    @movimentacao_de_estoque = MovimentacaoDeEstoque.find(params[:id])
  end

  # POST /movimentacao_de_estoques
  # POST /movimentacao_de_estoques.json
  def create
    @movimentacao_de_estoque = MovimentacaoDeEstoque.new(params[:movimentacao_de_estoque])

    respond_to do |format|
      if @movimentacao_de_estoque.save
        format.html { redirect_to @movimentacao_de_estoque, notice: 'Movimentacao de estoque was successfully created.' }
        format.json { render json: @movimentacao_de_estoque, status: :created, location: @movimentacao_de_estoque }
      else
        format.html { render action: "new" }
        format.json { render json: @movimentacao_de_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movimentacao_de_estoques/1
  # PUT /movimentacao_de_estoques/1.json
  def update
    @movimentacao_de_estoque = MovimentacaoDeEstoque.find(params[:id])

    respond_to do |format|
      if @movimentacao_de_estoque.update_attributes(params[:movimentacao_de_estoque])
        format.html { redirect_to @movimentacao_de_estoque, notice: 'Movimentacao de estoque was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movimentacao_de_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimentacao_de_estoques/1
  # DELETE /movimentacao_de_estoques/1.json
  def destroy
    @movimentacao_de_estoque = MovimentacaoDeEstoque.find(params[:id])
    @movimentacao_de_estoque.destroy

    respond_to do |format|
      format.html { redirect_to movimentacao_de_estoques_url }
      format.json { head :no_content }
    end
  end
end
