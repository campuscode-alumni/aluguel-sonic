require 'rails_helper'

describe NewProposalMailer, type: :mailer do
  describe "receive email new proposal" do
    it 'and receive an email' do

      proposal = create(:proposal, email: 'nailson.ita@ita.com')

      mail = NewProposalMailer.email_new_proposals(proposal.id)

      expect(mail.subject).to eq "Você recebeu uma nova proposta para o imovel #{proposal.property.title}"
      expect(mail.to).to include proposal.email
      expect(mail.from).to include 'no-reply@alugatemporada.com'

      end

  end

end
