require 'rails_helper'

feature 'owner register daily rate by season' do
  scenario 'succesfully' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path property
    click_on 'Cadastrar preço especifico para uma temporada'

    fill_in 'Nome', with: 'Férias de julho'
    fill_in 'Data início', with: '01/07/2018'
    fill_in 'Data fim', with: '31/07/2018'
    fill_in 'Preço da diaria', with: '150'
    click_on 'Registrar temporada'

    expect(current_path).to eq(property_path property)
    expect(page).to have_css('h3', text: 'Temporadas cadastradas:')
    expect(page).to have_css('h4', text: 'Férias de julho')
    expect(page).to have_css('dt', text: 'Data início')
    expect(page).to have_css('dt', text: 'Data fim')
    expect(page).to have_css('dt', text: 'Preço da diaria')

    expect(page).to have_css('dl', text: '01/07/2018')
    expect(page).to have_css('dl', text: '31/07/2018')
    expect(page).to have_css('dl', text: 'R$ 100,00')
  end

  scenario 'validates required fields' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path property
    click_on 'Cadastrar preço especifico para uma temporada'

    fill_in 'Nome', with: ''
    fill_in 'Data início', with: ''
    fill_in 'Data fim', with: ''
    fill_in 'Preço da diaria', with: ''
    click_on 'Registrar temporada'

    expect(current_path).to eq(property_seasons_path(property))
    expect(page).to have_css('div.alert.alert-danger', text:'Preencha todos os campos')
  end

  scenario 'check season price' do
    today = Date.today
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')
    season = property.seasons.create(name: 'Temporada de feriado',
                                      start_date: today-2, end_date: today + 2,
                                      daily_rate: '150')

    visit property_path(property)

    expect(page).to have_css('dt', text: 'Valor atual da diária')
    expect(page).to have_css('dd#current-season-price', text: 'R$ 150,00')

  end
end
