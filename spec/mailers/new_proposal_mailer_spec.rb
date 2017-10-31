require 'rails_helper'

describe NewProposalMailer, type: :mailer do
  describe "receive email new proposal" do
    it 'and receive an email' do

      property = create(:property, title: 'Casa em Cacapava', owner_email: 'prop@aluga.com')
      proposal = create(:proposal, property: property, user_name: 'Zezinho')

      mail = NewProposalMailer.email_new_proposals(property.id, proposal.id)

      expect(mail.subject).to eq "#{proposal.user_name} enviou uma proposta para o imovel: #{property.title}"
      expect(mail.to).to include property.owner_email
      expect(mail.from).to include 'no-reply@alugatemporada.com'

    end

    it 'with a body' do

      property = create(:property, title: 'Casa em Cacapava',
                        description: 'É uma casa na praia muito cara',
                        owner_email: 'prop@aluga.com',
                        property_location: 'Santos, São Paulo')
      proposal = create(:proposal, property: property, user_name: 'Zezinho',
                        rent_purpose: 'Casamento', email: 'nailson.ita@ita.com',
                        start_date: '16/10/2017', end_date: '19/10/2017',
                        total_amount: 600, total_guests: 5)

      mail = NewProposalMailer.email_new_proposals(property.id, proposal.id)

      expect(mail.body).to include 'Resumo dos dados do imóvel:'
      expect(mail.body).to include "#{property.title}"
      expect(mail.body).to include "#{property.description}"
      expect(mail.body).to include "#{property.property_location}"
      expect(mail.body).to include 'Dados da proposta:'
      expect(mail.body).to include "#{proposal.rent_purpose}"
      expect(mail.body).to include "#{proposal.user_name}"
      expect(mail.body).to include "#{proposal.email}"
      expect(mail.body).to include "#{I18n.l proposal.start_date}"
      expect(mail.body).to include "#{I18n.l proposal.end_date}"
      expect(mail.body).to include "#{proposal.total_amount}"
      expect(mail.body).to include "#{proposal.total_guests}"

    end

  end

end
