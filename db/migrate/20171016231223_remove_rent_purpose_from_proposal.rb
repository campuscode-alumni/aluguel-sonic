class RemoveRentPurposeFromProposal < ActiveRecord::Migration[5.1]
  def change
    remove_column :proposals, :rent_purpouse, :string
  end
end
