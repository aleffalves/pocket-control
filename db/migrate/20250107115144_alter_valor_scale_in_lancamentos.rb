class AlterValorScaleInLancamentos < ActiveRecord::Migration[7.1]
  def change
        change_column :lancamentos, :valor, :decimal, precision: 16, scale: 2
  end
end
