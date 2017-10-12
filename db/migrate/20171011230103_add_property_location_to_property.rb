class AddPropertyLocationToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :property_location, :string
  end
end
