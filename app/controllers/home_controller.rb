class HomeController < ApplicationController

  def index

  end

  def search
     @properties_search = params[:property_type]
     @properties = Property.where "property_type like ?", "%#{@properties_search}%"
  end
end
