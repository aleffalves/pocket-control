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
    @lancamentos_por_semana_mes = Lancamento.where(data: Date.today.beginning_of_month..Date.today.end_of_month)
    .group_by { |l| l.data.beginning_of_week(:sunday) }
    .transform_values { |lancamentos| lancamentos.sum(&:valor_cents) }

    @lancamentos_categoria_mes = Lancamento.joins(:categorium)
    .where(data: Date.today.beginning_of_month..Date.today.end_of_month)
    .group('categoria.nome')
    .sum(:valor_cents)

    @lancamentos_valor_mes = Lancamento.where(data: Date.today.beginning_of_month..Date.today.end_of_month).sum(:valor_cents) / 100.0
    @lancamentos_valor_semanal = Lancamento.where(data: Date.today.beginning_of_week..Date.today.end_of_week).sum(:valor_cents) / 100.0
  end

  def anual
    @lancamentos_por_mes_ano = Lancamento.where(data: Date.today.beginning_of_year..Date.today.end_of_year)
    .group_by { |l| l.data.beginning_of_month }
    .transform_values { |lancamentos| lancamentos.sum(&:valor_cents) }

    @lancamentos_categoria_ano = Lancamento.joins(:categorium)
    .where(data: Date.today.beginning_of_year..Date.today.end_of_year)
    .group('categoria.nome')
    .sum(:valor_cents)

    @lancamentos_valor_ano = Lancamento.where(data: Date.today.beginning_of_year..Date.today.end_of_year).sum(:valor_cents) / 100.0
    @lancamentos_valor_mes = Lancamento.where(data: Date.today.beginning_of_month..Date.today.end_of_month).sum(:valor_cents) / 100.0
  end

end
