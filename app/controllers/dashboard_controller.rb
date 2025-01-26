class DashboardController < ApplicationController

  def index
    @renderizar = params[:param] || 'semanal'

    if @renderizar == 'semanal'
      semanal
    elsif @renderizar == 'mensal'
      mensal
    elsif @renderizar == 'anual'
      anual  
    end

  end

  def semanal
    @lancamentos_por_dia_na_semana = Lancamento.where(data: Date.today.beginning_of_week..Date.today.end_of_week)
    .group("date(data)")
    .sum(:valor_cents)

    @lancamentos_categoria_semana = Lancamento.joins(:categorium)
    .where(data: Date.today.beginning_of_week..Date.today.end_of_week)
    .group('categoria.nome')
    .sum(:valor_cents)

    @lancamentos_valor_semana = Lancamento.where(data: Date.today.beginning_of_week..Date.today.end_of_week).sum(:valor_cents) / 100.0
    @lancamentos_valor_hoje = Lancamento.where(data: Date.today.beginning_of_day..Date.today.end_of_day).sum(:valor_cents) / 100.0
  end

  def mensal
  end

  def anual
  end

end
