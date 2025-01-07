class AddValorCurrencyToLancamentos < ActiveRecord::Migration[7.1]
  def change
    add_column :lancamentos, :valor_currency, :string, default: "BRL", null: false
  end
end
