class CreateReceita < ActiveRecord::Migration[7.1]
  def change
    create_table :receita do |t|
      t.references :consumidors, null: false, foreign_key: true
      t.references :categoria, null: false, foreign_key: true
      t.decimal :valor, precision: 16, scale: 2
      t.integer :valor_cents, default: 0, null: false
      t.string :valor_currency , default: "BRL", null: false
      t.datetime :data
      
      t.timestamps
    end
  end
end
