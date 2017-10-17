class AddRentPurposeAndPropertyReferenceToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :rent_purpouse, :text
    add_reference :proposals, :property, foreign_key: true
  end
end
