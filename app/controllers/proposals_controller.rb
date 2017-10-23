class ProposalsController < ApplicationController

  def new
    @property = Property.find(params[:property_id])
    @proposal = Proposal.new
  end

  def create
    @property = Property.find(params[:property_id])
    @proposal = @property.proposals.new(proposal_params)
    if @proposal.save
      flash[:notice] = 'Proposta enviada com sucesso.'
      redirect_to @proposal
    else
      render :new
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def accept
    proposal_accepted = Proposal.find(params[:id])
    property_of_the_proposal = proposal_accepted.property
    rejected_proposal(proposal_accepted, property_of_the_proposal)
    if proposal_accepted.accepted!
      flash[:notice] = "Proposta Aceita"
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

  def rejected_proposal(proposal_accepted, property_of_the_proposal)
    init_dt = proposal_accepted.start_date
    end_dt = proposal_accepted.end_date
    rejected = property_of_the_proposal.proposals.where("start_date >= ? AND end_date <= ?", init_dt, end_dt)
    rejected.each { |e| e.update(status: 2)  }
  end
end
