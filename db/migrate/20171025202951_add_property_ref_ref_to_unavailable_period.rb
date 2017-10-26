class AddPropertyRefRefToUnavailablePeriod < ActiveRecord::Migration[5.1]
  def change
    add_reference :unavailable_periods, :property, foreign_key: true
  end
end
