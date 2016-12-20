class AddColumnsToStopTimes < ActiveRecord::Migration[5.0]
  def change
    add_column :stop_times, :arrival_time, :string
    add_column :stop_times, :departure_time, :string
    add_column :stop_times, :stop_id, :string
    add_column :stop_times, :sequence, :string
    add_column :stop_times, :headsign, :string
    add_column :stop_times, :pickup_type, :string
    add_column :stop_times, :drop_off_type, :string
    add_column :stop_times, :shape_dist_travelled, :string
  end
end
