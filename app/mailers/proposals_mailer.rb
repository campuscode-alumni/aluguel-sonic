class ProposalsMailer < ApplicationMailer

  def accept_proposal(proposal_id)
    @proposal = Proposal.find(proposal_id)

    mail(to: @proposal.email,
    subject: "Sua proposta para #{@proposal.property.title} foi aprovada")
  end
end
