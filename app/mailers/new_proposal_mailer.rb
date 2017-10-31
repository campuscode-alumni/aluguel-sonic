class NewProposalMailer < ApplicationMailer
  def email_new_proposals(proposal_id)
    @proposal = Proposal.find(proposal_id)

    mail(subject: "Você recebeu uma nova proposta para o imovel #{@proposal.property.title}",
        to: @proposal.email)
  end
end
