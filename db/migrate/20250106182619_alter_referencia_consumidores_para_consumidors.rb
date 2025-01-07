class AlterReferenciaConsumidoresParaConsumidors < ActiveRecord::Migration[7.1]
  def change
        remove_reference :lancamentos, :consumidor, foreign_key: true
    
        add_reference :lancamentos, :consumidors, null: false, foreign_key: true
  end
end