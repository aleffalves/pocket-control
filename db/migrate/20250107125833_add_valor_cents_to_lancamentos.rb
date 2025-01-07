class AddValorCentsToLancamentos < ActiveRecord::Migration[7.1]
  def change
    add_column :lancamentos, :valor_cents, :integer, default: 0, null: false
  end
end
