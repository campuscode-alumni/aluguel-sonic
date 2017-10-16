class HomeController < ApplicationController

  def index

  end

  def search
     @properties = Property.where("property_type like ? or property_location like ?", params[:q], params[:q])
  end
end
