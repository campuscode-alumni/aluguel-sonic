class NewProposalMailer < ApplicationMailer
  def email_new_proposals(property_id, proposal_id)
    @property = Property.find(property_id)
    @proposal = Proposal.find(proposal_id)


    mail(subject: "#{@proposal.user_name} enviou uma proposta para o imovel: #{@property.title}",
        to: @property.owner_email)
  end
end
