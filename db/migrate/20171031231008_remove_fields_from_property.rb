class RemoveFieldsFromProperty < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :owner_document, :string
    remove_column :properties, :owner_name, :string
  end
end
