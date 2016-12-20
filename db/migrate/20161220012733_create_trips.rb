class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips, id: :string do |t|
      t.string :route_id, foreign_key: true
      t.timestamps
    end
  end
end
