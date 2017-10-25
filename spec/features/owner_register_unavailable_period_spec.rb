require 'rails_helper'

feature 'owner register unavailable period for rental' do
  scenario 'succesfully' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'casa na beira da praia', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'sem cachorro',
                                property_type:'Casa da praia')

    visit property_path(property)
    click_on 'Cadastrar período indisponível'

    expect(page).to have_css('h1', text: 'Cadastre o período de indisponibilidade')
    fill_in 'Data inicio', with: '20/12/2017'
    fill_in 'Data fim', with: '28/12/2017'

    click_on 'Cadastrar'

    expect(page).to have_css('div.success', text: 'Período cadastrado com sucesso.')

  end

  scenario 'and reject all proposals for unavailable period' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    period_unavailable = UnavailablePeriod.create(start_date_unavailable: '20/12/2017',
                                                  end_date_unavailable: '28/12/2017')


    visit new_property_proposal_path(property)

    expect(page).to have_css('legend', text: 'Formulário de envio de proposta')
    fill_in 'Nome da pessoa', with: 'Fulaninho'
    fill_in 'Email', with: 'fulano@cicrano.com.br'
    fill_in 'Data inicio', with: '20/12/2017'
    fill_in 'Data fim', with: '28/12/2017'
    fill_in 'Quantidade de pessoas', with: 10
    fill_in 'Proposito da Locação', with: 'Festa'
    click_on 'Enviar'

    property.reload
    expect(page).to have_css('div.error', text: 'Imovel indisponivel para esse periodo')
    expect(property.proposals.count).to eq 0
  end

end