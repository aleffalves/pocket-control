class ConsumidorsController < ApplicationController
  before_action :set_consumidor, only: %i[ show edit update destroy ]

  # GET /consumidors or /consumidors.json
  def index
    @consumidors = Consumidor.all
  end

  # GET /consumidors/1 or /consumidors/1.json
  def show
  end

  # GET /consumidors/new
  def new
    @consumidor = Consumidor.new
  end

  # GET /consumidors/1/edit
  def edit
  end

  # POST /consumidors or /consumidors.json
  def create
    @consumidor = Consumidor.new(consumidor_params)

    respond_to do |format|
      if @consumidor.save
        format.html { redirect_to @consumidor, notice: "Consumidor was successfully created." }
        format.json { render :show, status: :created, location: @consumidor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consumidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumidors/1 or /consumidors/1.json
  def update
    respond_to do |format|
      if @consumidor.update(consumidor_params)
        format.html { redirect_to @consumidor, notice: "Consumidor was successfully updated." }
        format.json { render :show, status: :ok, location: @consumidor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consumidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumidors/1 or /consumidors/1.json
  def destroy
    @consumidor.destroy!

    respond_to do |format|
      format.html { redirect_to consumidors_path, status: :see_other, notice: "Consumidor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumidor
      @consumidor = Consumidor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consumidor_params
      params.require(:consumidor).permit(:nome, :usuario_id)
    end
end
