class HomeController < ApplicationController

  def index
    @properties = Property.all
    @proposals = Proposal.where(user: current_user)
  end

  def search
     @properties = Property.where("property_type like ? or property_location like ?", params[:q], params[:q])
  end
end
