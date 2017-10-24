# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :date
#  end_date    :date
#  daily_rate  :decimal(, )
#  property_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Season < ApplicationRecord
  belongs_to :property

  validates :name, :start_date, :end_date, :daily_rate,
            presence: {message: 'Preencha todos os campos'}

  validate :check_truncated_dates

  private
  def check_truncated_dates
    query = '(start_date <= :season_start_date AND end_date >= :season_start_date)
              OR (start_date <= :season_end_date AND end_date >= :season_end_date)'
    check_season = property.seasons.where(query,
          {season_start_date: start_date, season_end_date: end_date}).first
    if check_season
      errors.add(:start_date,
            'Existe uma temporada com conflitos nesse intervalo de datas')
    end
  end
end
