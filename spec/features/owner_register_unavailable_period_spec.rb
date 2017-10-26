require 'rails_helper'

feature 'owner register unavailable period for rental' do
  scenario 'succesfully' do

    property = create(:property)

    visit property_path(property)
    click_on 'Cadastrar período indisponível'

    expect(page).to have_css('h1', text: 'Cadastre o período de indisponibilidade')
    fill_in 'Data inicio', with: '20/12/2017'
    fill_in 'Data fim', with: '28/12/2017'

    click_on 'Cadastrar'

    expect(page).to have_css('div.success', text: 'Período cadastrado com sucesso.')

  end

  scenario 'and reject all proposals for unavailable period' do

    property = create(:property)

    period_unavailable = UnavailablePeriod.create(start_date_unavailable: '22/12/2017',
                                                  end_date_unavailable: '28/12/2017',
                                                  property: property)


    visit new_property_proposal_path(property)

    expect(page).to have_css('legend', text: 'Formulário de envio de proposta')
    fill_in 'Nome da pessoa', with: 'Fulaninho'
    fill_in 'Email', with: 'fulano@cicrano.com.br'
    fill_in 'Data inicio', with: '22/12/2017'
    fill_in 'Data fim', with: '28/12/2017'
    fill_in 'Quantidade de pessoas', with: 8
    fill_in 'Proposito da Locação', with: 'Festa'
    check 'Concordar com as regras'
    click_on 'Enviar'

    property.reload

    expect(page).to have_css('div.error', text: 'Imovel indisponivel para esse periodo')

    expect(property.proposals.count).to eq 0
  end

end
