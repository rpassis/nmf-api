class AddColumnsToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :short_name, :string
    add_column :routes, :long_name, :string
    add_column :routes, :of_type, :string
    add_column :routes, :desc, :string
    add_column :routes, :url, :string
    add_column :routes, :color, :string
    add_column :routes, :text_color, :string
  end
end
