class AddOwnerInfosToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :owner_document, :string
    add_column :properties, :owner_name, :string
  end
end
