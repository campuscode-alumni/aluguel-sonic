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

        travel_to(Date.parse('2017/10/18')) do

          mail = ProposalsMailer.accept_proposal(proposal.id)
          email_body_title = "Comprovante de Locação"

          email_body_docs = "Eu, #{proposal.property.owner_name}, portador(a) do "+
                            "CPF nº #{proposal.property.owner_document}, declaro " +
                            "para os devidos fins que alugo o imóvel sito à "+
                            "#{proposal.property.address}, para " +
                            "#{proposal.user_name}, portador(a) do CPF "+
                            "nº #{proposal.user_document}, entre o período de "+
                            "#{proposal.start_date} a #{proposal.end_date}, "+
                            "pelo valor total de #{proposal.total_amount}. "

          email_body_rules = "Para este período devem ser respeitados as seguintes "+
                            "regras de uso: "+
                            "O imóvel não deve ser hospedado por mais que "+
                            "#{proposal.property.maximum_occupancy} pessoas; "+
                            "O prazo de locação deve ser respeitado e casos de renovações "+
                            "devem ser tratados diretamente com o proprietário; "+
                            "Além destas, devem ser respeitadas também as "+
                            "seguintes regras: (outras regras descritas pelo proprietário) "+
                            "São Paulo, 18 de Outubo de 2017"

          expect(mail.body.encoded).to include email_body_docs
          expect(mail.body.encoded).to include email_body_rules
      end
    end
  end
end
