class UnavailablePeriodsController < ApplicationController
  def new
    @unavailable_period = UnavailablePeriod.new
    @property = Property.find(params[:property_id])
  end

  def create
    @property = Property.find(params[:property_id])
    @unavailable_period = UnavailablePeriod.new(unavailable_period_params)

    if @unavailable_period.save
      flash[:notice] = 'Período cadastrado com sucesso.'
      redirect_to @property
    else
      render :new
    end
  end

  private

  def unavailable_period_params
    params.require(:unavailable_period).permit(:start_date_unavailable, :end_date_unavailable, :description)
  end

end
