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

    expect(page).to have_css('p', text: 'Período cadastrado com sucesso.')

  end
end
