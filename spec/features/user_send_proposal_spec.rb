require 'rails_helper'

feature 'user send proposal to property owner' do
  scenario 'successfully' do
    property = Property.create(title:'Casa na praia', location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path(property)

    fill_in 'Nome da pessoa', with: 'Fulaninho'
    fill_in 'Email', with: 'fulano@cicrano.com.br'
    fill_in 'Data inicio', with: '10/12/2017'
    fill_in 'Data fim', with: '20/12/2017'
    fill_in 'Quantidade de pessoas', with: 10
    fill_in 'Proposito da Locação', with: 'Festa'
    check 'Concordar com as regras'

    click_on 'Enviar'

    expect(page).to have_css('div.success', text: 'Proposta enviada com sucesso.')

  end
end
