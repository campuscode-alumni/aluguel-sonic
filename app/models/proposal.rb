require 'date'

class Proposal < ApplicationRecord
  belongs_to :property

  before_save :calculate_total_amount

  validates :user_name, :email, :start_date, :end_date, :total_guests,
            :rent_purpose, presence: {message: 'Você deve preencher todos os campos'}
  validates :agree_with_rules,
            acceptance: {message: 'Você deve estar de acordo com as regras'}


  private

  def calculate_total_amount
    calc_start_date = Date.parse(start_date)
    calc_end_date = Date.parse(end_date)
    date_diff = (calc_end_date - calc_start_date).to_i
    self.total_amount = date_diff * property.daily_rate
  end
end
