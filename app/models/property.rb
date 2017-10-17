class Property < ApplicationRecord
  has_many :proposals
  validates :title, :location, :property_type, :daily_rate, :photo,
            :description, presence: true
end
