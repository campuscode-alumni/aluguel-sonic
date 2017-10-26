class AddPeriodRefToProperty < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :period, foreign_key: true
  end
end
