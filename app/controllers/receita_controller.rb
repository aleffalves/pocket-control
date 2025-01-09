class ReceitaController < ApplicationController
  before_action :set_receitum, only: %i[ show edit update destroy ]
  before_action :format_valor, only: %i[ create update ]

  # GET /receita or /receita.json
  def index
    if params[:mes].present? && params[:ano].present?
      mes = params[:mes].to_i
      ano = params[:ano].to_i

      if ActiveRecord::Base.connection.adapter_name == 'SQLite'
        # Para SQLite, use strftime
        @receita = Receitum.where("strftime('%m', data) = ? AND strftime('%Y', data) = ?", mes.to_s.rjust(2, '0'), ano.to_s)
      else
        # Para PostgreSQL, use EXTRACT
        @receita = Receitum.where("EXTRACT(MONTH FROM data) = ? AND EXTRACT(YEAR FROM data) = ?", mes, ano)
      end

      @receita = @receita.order(data: :desc)
    end
  end

  # GET /receita/1 or /receita/1.json
  def show
  end

  # GET /receita/new
  def new
    @receitum = Receitum.new
    @receitum.data ||= Time.now
    set_collections
  end

  # GET /receita/1/edit
  def edit
    set_collections
  end

  # POST /receita or /receita.json
  def create
    @receitum = Receitum.new(receitum_params)

    respond_to do |format|
      if @receitum.save
        format.html { redirect_to @receitum, notice: "Receita criada com sucesso." }
        format.json { render :show, status: :created, location: @receitum }
      else
        set_collections
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receita/1 or /receita/1.json
  def update
    respond_to do |format|
      if @receitum.update(receitum_params)
        format.html { redirect_to @receitum, notice: "Receita atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @receitum }
      else
        set_collections
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receita/1 or /receita/1.json
  def destroy
    @receitum.destroy!

    respond_to do |format|
      format.html { redirect_to receita_path, status: :see_other, notice: "Receita deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receitum
      @receitum = Receitum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receitum_params
      params.require(:receitum).permit(:consumidors_id, :categoria_id, :valor, :data)
    end

    private
    def format_valor
      if params[:receitum][:valor].present?
        params[:receitum][:valor] = params[:receitum][:valor].to_s.gsub('.', '').gsub(',', '.').to_f
      end
    end

  def set_collections
      @consumidores = Consumidor.all
      @categorias = Categorium.all
  end
end
