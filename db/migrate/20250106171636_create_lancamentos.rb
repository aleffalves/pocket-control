class CreateLancamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :lancamentos do |t|
      t.references :consumidores, null: false, foreign_key: true
      t.references :categoria, null: false, foreign_key: true
      t.decimal :valor
      t.datetime :data

      t.timestamps
    end
  end
end
