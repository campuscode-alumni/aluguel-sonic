class RenameRentPurpose < ActiveRecord::Migration[5.1]
  def change
    rename_column :proposals, :rent_purpouse, :rent_purpose
  end
end
