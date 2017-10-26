class AddProposalUserDocumentToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :user_document, :string
  end
end
