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

ActiveRecord::Schema.define(:version => 20140102183633) do

  create_table "feedbacks", :force => true do |t|
    t.datetime "date"
    t.integer  "labor_id"
    t.integer  "user_id"
    t.integer  "transaction_id"
    t.string   "feedback"
    t.decimal  "rating",         :precision => 2, :scale => 1
  end

  create_table "labors", :force => true do |t|
    t.integer "types_of_service_id"
    t.string  "labor_name"
    t.string  "address"
    t.integer "phone"
    t.integer "charges",             :limit => 10, :precision => 10, :scale => 0
    t.string  "status"
  end

  create_table "service_transactions", :force => true do |t|
    t.integer  "transaction_id"
    t.integer  "service_id"
    t.integer  "user_id"
    t.integer  "labor_id"
    t.string   "address"
    t.string   "description"
    t.string   "status"
    t.date     "date"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types_of_services", :force => true do |t|
    t.string   "service_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userdetails", :force => true do |t|
    t.string "username"
    t.string "password"
    t.string "firstname"
    t.string "lastname"
    t.date   "birthday"
    t.string "email"
    t.string "phone"
    t.string "status"
  end

end
