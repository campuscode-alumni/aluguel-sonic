class AddFieldsToOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :name, :string
    add_column :owners, :document, :string
  end
end
