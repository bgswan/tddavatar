# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100629125132) do

  create_table "appointments", :force => true do |t|
    t.string   "owner"
    t.string   "patient"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charge_descriptions", :force => true do |t|
    t.string   "treatment"
    t.decimal  "cost",       :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charges", :force => true do |t|
    t.integer  "charge_description_id"
    t.decimal  "cost",                  :precision => 6, :scale => 2
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.decimal  "amount",         :precision => 6, :scale => 2
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
