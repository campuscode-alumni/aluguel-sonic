class SeasonsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @season = Season.new
  end

  def create
    @property = Property.find(params[:property_id])
    @season = @property.seasons.new(season_params)
    if @season.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  private
  def season_params
    params.require(:season).permit(:name, :start_date, :end_date, :daily_rate)
  end
end
