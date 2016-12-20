class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies, id: :string do |t|      
      t.timestamps
    end
  end
end
