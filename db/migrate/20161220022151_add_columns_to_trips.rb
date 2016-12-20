class AddColumnsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :service_id, :string
    add_column :trips, :headsign, :string
    add_column :trips, :short_name, :string
    add_column :trips, :direction_id, :string
    add_column :trips, :block_id, :string
    add_column :trips, :shape_id, :string
    add_column :trips, :wheelchair_accessible, :string
    add_column :trips, :bikes_allowed, :string
  end
end
