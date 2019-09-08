# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_08_140739) do

  create_table "fight_attendances", force: :cascade do |t|
    t.integer "fight_id"
    t.integer "fighter_id"
    t.boolean "winner", default: false
    t.boolean "loser", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fight_id"], name: "index_fight_attendances_on_fight_id"
    t.index ["fighter_id"], name: "index_fight_attendances_on_fighter_id"
  end

  create_table "fight_steps", force: :cascade do |t|
    t.integer "fight_id", null: false
    t.string "hands", null: false
    t.string "damage_points", default: "0,0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remaining_life_points"
    t.index ["fight_id"], name: "index_fight_steps_on_fight_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "life_points", default: 0
    t.integer "attack_points", default: 0
    t.integer "level", default: 0
    t.integer "exp_points", default: 0
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fight_steps_count", default: 0
    t.integer "exp_points", default: 0
  end

  add_foreign_key "fight_steps", "fights"
end
