class AddEventsHandledToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :events_handled, :integer
  end
end
