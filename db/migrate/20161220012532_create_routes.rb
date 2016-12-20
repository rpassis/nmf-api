class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes, id: :string do |t|
      t.string :agency_id, foreign_key: true
      t.timestamps
    end
  end
end
