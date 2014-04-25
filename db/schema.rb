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

ActiveRecord::Schema.define(version: 20140425032132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.string   "type",                                null: false
    t.integer  "scholar_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "attendees", ["email"], name: "index_attendees_on_email", unique: true, using: :btree
  add_index "attendees", ["invitation_token"], name: "index_attendees_on_invitation_token", unique: true, using: :btree
  add_index "attendees", ["invitations_count"], name: "index_attendees_on_invitations_count", using: :btree
  add_index "attendees", ["invited_by_id"], name: "index_attendees_on_invited_by_id", using: :btree
  add_index "attendees", ["reset_password_token"], name: "index_attendees_on_reset_password_token", unique: true, using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "attendee_id",      null: false
    t.text     "testimonial"
    t.text     "private_feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
