class AddUnavailablePeriodRefToProperty < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :unavailable_period, foreign_key: true
  end
end
