class RemoveUnavailablePeriodIdFromProperty < ActiveRecord::Migration[5.1]
  def change
    remove_reference :properties, :unavailable_period_id, foreign_key: true
  end
end
