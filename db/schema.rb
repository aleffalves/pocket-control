# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_01_09_162614) do
  create_table "categoria", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumidors", force: :cascade do |t|
    t.string "nome"
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_consumidors_on_usuario_id"
  end

  create_table "lancamentos", force: :cascade do |t|
    t.integer "categoria_id", null: false
    t.decimal "valor", precision: 16, scale: 2
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "consumidors_id", null: false
    t.integer "valor_cents", default: 0, null: false
    t.string "valor_currency", default: "BRL", null: false
    t.index ["categoria_id"], name: "index_lancamentos_on_categoria_id"
    t.index ["consumidors_id"], name: "index_lancamentos_on_consumidors_id"
  end

  create_table "receita", force: :cascade do |t|
    t.integer "consumidors_id", null: false
    t.integer "categoria_id", null: false
    t.decimal "valor", precision: 16, scale: 2
    t.integer "valor_cents", default: 0, null: false
    t.string "valor_currency", default: "BRL", null: false
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_receita_on_categoria_id"
    t.index ["consumidors_id"], name: "index_receita_on_consumidors_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "consumidors", "usuarios"
  add_foreign_key "lancamentos", "categoria", column: "categoria_id"
  add_foreign_key "lancamentos", "consumidors", column: "consumidors_id"
  add_foreign_key "receita", "categoria", column: "categoria_id"
  add_foreign_key "receita", "consumidors", column: "consumidors_id"
end
