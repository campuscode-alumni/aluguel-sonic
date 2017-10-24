class UnavailablePeriodsController < ApplicationController
  def new
    @unavailable_period = UnavailablePeriod.new
    @property = Property.find(params[:property_id])
  end

  def create
    @property = Property.find(params[:property_id])
    @unavailable_period = UnavailablePeriod.new(unavailable_period_params)
  end

  private

  def unavailable_period_params
    #code
  end

end
