class Property < ApplicationRecord
  validates :title, :location, :property_type, :daily_rate, :photo,
            :description, presence: true
end
