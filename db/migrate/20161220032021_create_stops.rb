class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops, id: :string do |t|
      t.string :stop_time_id, foreign_key: true
      t.timestamps
    end
  end
end
