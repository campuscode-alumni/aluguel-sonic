class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.decimal :daily_rate
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
