class CreateConsumidors < ActiveRecord::Migration[7.1]
  def change
    create_table :consumidors do |t|
      t.string :nome
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
