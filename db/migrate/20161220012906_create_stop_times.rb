class CreateStopTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :stop_times, id: :string do |t|
      t.string :trip_id, foreign_key: true
      t.timestamps
    end
  end
end
