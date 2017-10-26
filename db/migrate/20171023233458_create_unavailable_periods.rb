class CreateUnavailablePeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :unavailable_periods do |t|
      t.date :start_date_unavailable
      t.date :end_date_unavailable
      t.string :description

      t.timestamps
    end
  end
end
