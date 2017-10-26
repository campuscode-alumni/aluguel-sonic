require 'rails_helper'

describe ProposalsMailer, type: :mailer do
  describe "accept proposal" do
    it 'and receives an email' do

      proposal = create(:proposal)

      mail = ProposalsMailer.accept_proposal(proposal.id)

      expect(mail.subject).to eq "Sua proposta para #{proposal.property.title} foi aprovada"
      expect(mail.to).to include proposal.email
      expect(mail.from).to include 'no-reply@alugatemporada.com'
    end

    it 'renders body' do
      proposal = create(:proposal)

      mail = ProposalsMailer.accept_proposal(proposal.id)
      expect(mail.body.encoded).to match "Comece a planejar sua viagem para #{proposal.property.title}"
    end
  end
end
