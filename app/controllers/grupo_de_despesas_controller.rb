class GrupoDeDespesasController < ApplicationController
  # GET /grupo_de_despesas
  # GET /grupo_de_despesas.json
  def index
    @grupo_de_despesas = GrupoDeDespesa.order(:data_das_despesas)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grupo_de_despesas }
    end
  end

  # GET /grupo_de_despesas/1
  # GET /grupo_de_despesas/1.json
  def show
    @grupo_de_despesa = GrupoDeDespesa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grupo_de_despesa }
    end
  end

  # GET /grupo_de_despesas/new
  # GET /grupo_de_despesas/new.json
  def new
    @grupo_de_despesa = GrupoDeDespesa.new
	#Date.strptime('03-02-2001', '%d-%m-%Y')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grupo_de_despesa }
    end
  end

  # GET /grupo_de_despesas/1/edit
  def edit
    @grupo_de_despesa = GrupoDeDespesa.find(params[:id])
  end

  # POST /grupo_de_despesas
  # POST /grupo_de_despesas.json
  def create
    @grupo_de_despesa = GrupoDeDespesa.new()
	@grupo_de_despesa[:descricao] = params[:grupo_de_despesa][:descricao]
	@grupo_de_despesa[:data_das_despesas] = params[:grupo_de_despesa][:data_das_despesas]
	@grupo_de_despesa[:usuario] = Usuario.find(params[:grupo_de_despesa][:usuario].to_i)

    respond_to do |format|
      if @grupo_de_despesa.save
        format.html { redirect_to @grupo_de_despesa, notice: 'Grupo de despesa was successfully created.' }
        format.json { render json: @grupo_de_despesa, status: :created, location: @grupo_de_despesa }
      else
        format.html { render action: "new" }
        format.json { render json: @grupo_de_despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grupo_de_despesas/1
  # PUT /grupo_de_despesas/1.json
  def update
    @grupo_de_despesa = GrupoDeDespesa.find(params[:id])

    respond_to do |format|
      if @grupo_de_despesa.update_attributes(params[:grupo_de_despesa])
        format.html { redirect_to @grupo_de_despesa, notice: 'Grupo de despesa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grupo_de_despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupo_de_despesas/1
  # DELETE /grupo_de_despesas/1.json
  def destroy
    @grupo_de_despesa = GrupoDeDespesa.find(params[:id])
    @grupo_de_despesa.destroy

    respond_to do |format|
      format.html { redirect_to grupo_de_despesas_url }
      format.json { head :no_content }
    end
  end
end
