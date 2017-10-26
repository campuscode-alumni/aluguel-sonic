# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  area              :string
#  title             :string
#  description       :text
#  daily_rate        :decimal(, )
#  rooms             :integer
#  minimum_rent_days :integer
#  maximum_rent_days :integer
#  photo             :string
#  maximum_occupancy :integer
#  usage_rules       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  property_location :string
#  property_type     :string
#

class Property < ApplicationRecord
  has_many :proposals

  has_many :unavailable_periods
  validates :title, :property_location, :property_type, :daily_rate, :photo,
            :description, presence: true

  has_many :seasons
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates :title, :property_location, :property_type, :daily_rate, :photo,
            :description,
            presence: {message: "Você deve preencher os campos obrigatórios"}

  def current_season_price
    season = seasons.where("start_date <= :start AND end_date >= :start",
                  {start: Date.today}).last
    if season
      season.daily_rate
    else
      daily_rate
    end
  end
end
