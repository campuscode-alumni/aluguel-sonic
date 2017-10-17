class AddAgreeWithRulesToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :agree_with_rules, :boolean
  end
end
