require 'rails_helper'

feature 'Owner receive email new proposals' do
  scenario 'successfully' do

    property = create(:property)

    visit root_path
    click_on property.title
    click_on 'Enviar proposta'

    fill_in 'Nome da pessoa', with: 'João Almeida'
    fill_in 'Email', with: 'jalmeida@gmail.com'
    fill_in 'Data inicio', with: '15/12/2017'
    fill_in 'Data fim', with: '20/12/2017'
    fill_in 'Quantidade de pessoas', with: 6
    fill_in 'Proposito da Locação', with: 'Passeio de família'
    check 'Concordar com as regras'

    expect(NewProposalMailer).to receive(:email_new_proposals)

    click_on 'Enviar'
  end
end
