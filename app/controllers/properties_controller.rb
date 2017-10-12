class PropertiesController < ApplicationController

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:message] = 'Imóvel cadastrado com sucesso!'
      redirect_to @property
    else
      flash[:error] = 'Você deve preencher os campos obrigatórios'
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:location, :area, :title, :description,
                                    :daily_rate, :rooms, :minimum_rent_days,
                                    :maximum_rent_days, :photo,
                                    :maximum_occupancy, :usage_rules,
                                    :property_type)
  end
end
