class Season < ApplicationRecord
  belongs_to :property

  validates :name, :start_date, :end_date, :daily_rate,
            presence: {message: 'Preencha todos os campos'}
            
end
