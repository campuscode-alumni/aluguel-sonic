class AddOwnerEmailToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :owner_email, :string
  end
end
