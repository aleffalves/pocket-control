class LancamentosController < ApplicationController
  before_action :set_lancamento, only: %i[ show edit update destroy ]
  before_action :format_valor, only: %i[ create update ]

  # GET /lancamentos or /lancamentos.json
  def index
  
    if params[:mes].present? && params[:ano].present?
      mes = params[:mes].to_i
      ano = params[:ano].to_i

      if ActiveRecord::Base.connection.adapter_name == 'SQLite'
        # Para SQLite, use strftime
        @lancamentos = Lancamento.where("strftime('%m', data) = ? AND strftime('%Y', data) = ?", mes.to_s.rjust(2, '0'), ano.to_s)
      else
        # Para PostgreSQL, use EXTRACT
        @lancamentos = Lancamento.where("EXTRACT(MONTH FROM data) = ? AND EXTRACT(YEAR FROM data) = ?", mes, ano)
      end

      @lancamentos = @lancamentos.order(data: :desc)
    end
  end

  # GET /lancamentos/1 or /lancamentos/1.json
  def show
  end

  # GET /lancamentos/new
  def new
    @lancamento = Lancamento.new
    @lancamento.data ||= Time.now
    set_collections
  end

  # GET /lancamentos/1/edit
  def edit
    set_collections
  end

  # POST /lancamentos or /lancamentos.json
  def create
    @lancamento = Lancamento.new(lancamento_params)

    respond_to do |format|
      if @lancamento.save
        format.html { redirect_to @lancamento, notice: "Lançamento criado com sucesso." }
        format.json { render :show, status: :created, location: @lancamento }
      else
        set_collections
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lancamentos/1 or /lancamentos/1.json
  def update
    respond_to do |format|
      if @lancamento.update(lancamento_params)
        format.html { redirect_to @lancamento, notice: "Lançamento atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @lancamento }
      else
        set_collections
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lancamentos/1 or /lancamentos/1.json
  def destroy
    @lancamento.destroy!

    respond_to do |format|
      format.html { redirect_to lancamentos_path, status: :see_other, notice: "Lancamento deletado com sucesso." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lancamento
      @lancamento = Lancamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lancamento_params
      params.require(:lancamento).permit(:consumidors_id, :categoria_id, :valor, :data)
    end
    

  private
    def format_valor
      if params[:lancamento][:valor].present?
        params[:lancamento][:valor] = params[:lancamento][:valor].to_s.gsub('.', '').gsub(',', '.').to_f
      end
    end

  def set_collections
      @consumidores = Consumidor.all
      @categorias = Categorium.all
  end

end
