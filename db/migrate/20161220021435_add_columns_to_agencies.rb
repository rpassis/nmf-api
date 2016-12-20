class AddColumnsToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :name, :string
    add_column :agencies, :url, :string
    add_column :agencies, :timezone, :string
    add_column :agencies, :lang, :string
    add_column :agencies, :phone, :string
  end
end
