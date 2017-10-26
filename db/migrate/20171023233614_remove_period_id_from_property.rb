class RemovePeriodIdFromProperty < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :period_id, :integer
  end
end
