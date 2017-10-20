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

  def accept
    proposal_accept = Proposal.find(params[:id])
    property = proposal_accept.property
    if proposal_accept.update(status: 'accepted')
      flash[:notice] = "Proposta aceita"
      canceled_proposal = property.proposals - [proposal_accept]
    else
      render :show
    end
      redirect_to proposal_path
  end

  private

  def proposal_params
    params.require(:proposal).permit(:user_name, :email, :start_date, :end_date,
                                :total_guests, :rent_purpose, :agree_with_rules)
  end

  def canceled_proposal
    @property.proposals.each do |proposal|
      proposal.status = 'canceled'
    end
  end
end
