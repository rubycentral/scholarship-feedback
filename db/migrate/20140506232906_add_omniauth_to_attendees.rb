class AddOmniauthToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :provider, :string
    add_column :attendees, :uid, :string
  end
end
