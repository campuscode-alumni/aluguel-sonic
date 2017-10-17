class ProposalsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @proposal = Proposal.new
  end

  def create
    @property = Property.find(params[:property_id])
    @proposal = @property.proposals.create(proposal_params)
    flash[:message] = 'Proposta enviada com sucesso.'
    redirect_to @proposal
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private

  def proposal_params
    params.require(:proposal).permit(:user_name, :email, :start_date, :end_date,
                                :total_guests, :rent_purpouse)
  end
end
