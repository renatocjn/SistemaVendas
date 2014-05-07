class RepresentantesController < ApplicationController
  # GET /representantes
  # GET /representantes.json
  def index
    @representantes = Representante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @representantes }
    end
  end

  # GET /representantes/1
  # GET /representantes/1.json
  def show
    @representante = Representante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @representante }
    end
  end

  # GET /representantes/new
  # GET /representantes/new.json
  def new
    @representante = Representante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @representante }
    end
  end

  # GET /representantes/1/edit
  def edit
    @representante = Representante.find(params[:id])
  end

  # POST /representantes
  # POST /representantes.json
  def create
    @representante = Representante.new(params[:representante])

    respond_to do |format|
      if @representante.save
        format.html { redirect_to @representante, notice: 'Representante was successfully created.' }
        format.json { render json: @representante, status: :created, location: @representante }
      else
        format.html { render action: "new" }
        format.json { render json: @representante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /representantes/1
  # PUT /representantes/1.json
  def update
    @representante = Representante.find(params[:id])

    respond_to do |format|
      if @representante.update_attributes(params[:representante])
        format.html { redirect_to @representante, notice: 'Representante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @representante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /representantes/1
  # DELETE /representantes/1.json
  def destroy
    @representante = Representante.find(params[:id])
    @representante.destroy

    respond_to do |format|
      format.html { redirect_to representantes_url }
      format.json { head :no_content }
    end
  end
  
end
