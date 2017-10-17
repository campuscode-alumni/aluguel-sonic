class ProposalsController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @proposal = Proposal.new
  end

  def create
    @property = Property.find(params[:property_id])
    @proposal = @property.proposals.new(proposal_params)
    if @proposal.save
      flash[:message] = 'Proposta enviada com sucesso.'
      redirect_to @proposal
    else
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  private

  def proposal_params
    params.require(:proposal).permit(:user_name, :email, :start_date, :end_date,
                                :total_guests, :rent_purpose, :agree_with_rules)
  end
end
