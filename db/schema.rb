# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140202161047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "postgis"

  create_table "characteristics", force: true do |t|
    t.string   "title",                    null: false
    t.text     "description"
    t.hstore   "attrs",       default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characteristics", ["attrs"], name: "characteristics_attrs_gin_index", using: :gin

  create_table "entities", force: true do |t|
    t.integer  "entity_type_id"
    t.hstore   "attrs",                                   default: {}
    t.decimal  "latitude",       precision: 10, scale: 6
    t.decimal  "longitude",      precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entities", ["attrs"], name: "entities_attrs_gin_index", using: :gin
  add_index "entities", ["entity_type_id"], name: "index_entities_on_entity_type_id", using: :btree

  create_table "entity_types", force: true do |t|
    t.string   "name",                     null: false
    t.text     "description"
    t.hstore   "attrs",       default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entity_types", ["attrs"], name: "entity_types_attrs_gin_index", using: :gin

  create_table "entity_types_interactions", force: true do |t|
    t.integer "entity_type_id", null: false
    t.integer "interaction_id", null: false
  end

  add_index "entity_types_interactions", ["entity_type_id", "interaction_id"], name: "entity_types_interactions_unqiue_index", unique: true, using: :btree
  add_index "entity_types_interactions", ["entity_type_id"], name: "index_entity_types_interactions_on_entity_type_id", using: :btree
  add_index "entity_types_interactions", ["interaction_id"], name: "index_entity_types_interactions_on_interaction_id", using: :btree

  create_table "interactions", force: true do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", force: true do |t|
    t.string   "name",                     null: false
    t.text     "description"
    t.hstore   "attrs",       default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_types", ["attrs"], name: "item_types_attrs_gin_index", using: :gin

  create_table "items", force: true do |t|
    t.integer  "item_type_id"
    t.hstore   "attrs",                                 default: {}
    t.decimal  "latitude",     precision: 10, scale: 6
    t.decimal  "longitude",    precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["attrs"], name: "items_attrs_gin_index", using: :gin
  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id", using: :btree

  create_table "player_characteristics", force: true do |t|
    t.integer  "player_id",                       null: false
    t.integer  "characteristic_id",               null: false
    t.float    "value",             default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_characteristics", ["characteristic_id"], name: "index_player_characteristics_on_characteristic_id", using: :btree
  add_index "player_characteristics", ["player_id", "characteristic_id"], name: "index_player_characteristics_on_player_id_and_characteristic_id", unique: true, using: :btree
  add_index "player_characteristics", ["player_id"], name: "index_player_characteristics_on_player_id", using: :btree

  create_table "player_skills", force: true do |t|
    t.integer  "player_id",    null: false
    t.integer  "skill_id",     null: false
    t.datetime "last_used_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_skills", ["player_id", "skill_id"], name: "index_player_skills_on_player_id_and_skill_id", unique: true, using: :btree
  add_index "player_skills", ["player_id"], name: "index_player_skills_on_player_id", using: :btree
  add_index "player_skills", ["skill_id"], name: "index_player_skills_on_skill_id", using: :btree

  create_table "players", force: true do |t|
    t.integer  "user_id"
    t.decimal  "latitude",   precision: 10, scale: 6
    t.decimal  "longitude",  precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "skill_dependencies", force: true do |t|
    t.integer "from_id", null: false
    t.integer "to_id",   null: false
  end

  add_index "skill_dependencies", ["from_id", "to_id"], name: "index_skill_dependencies_on_from_id_and_to_id", unique: true, using: :btree

  create_table "skills", force: true do |t|
    t.string   "title",                    null: false
    t.text     "description"
    t.hstore   "attrs",       default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["attrs"], name: "skills_attrs_gin_index", using: :gin

  create_table "skills_interactions", force: true do |t|
    t.integer "skill_id",       null: false
    t.integer "interaction_id", null: false
  end

  add_index "skills_interactions", ["interaction_id"], name: "index_skills_interactions_on_interaction_id", using: :btree
  add_index "skills_interactions", ["skill_id", "interaction_id"], name: "skills_interactions_unique_index", unique: true, using: :btree
  add_index "skills_interactions", ["skill_id"], name: "index_skills_interactions_on_skill_id", using: :btree

  create_table "spatial_ref_sys", id: false, force: true do |t|
    t.integer "srid",                   null: false
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "nick"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
