class AddEventToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :event_id, :integer, null: false
  end
end
