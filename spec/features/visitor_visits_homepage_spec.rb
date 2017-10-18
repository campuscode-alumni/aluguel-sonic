require 'rails_helper'

feature 'visitor visits homepage' do
  scenario 'successfully' do
    visit root_path

    site_description = 'O melhor site para alugar imóveis da internet'
    expect(page).to have_css('h1', text: 'Aluga temporada')
    expect(page).to have_css('p.lead', text: site_description)
  end

  scenario 'and sees a property' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit root_path

    expect(page).to have_css('h2', text: 'Imóveis:')
    expect(page).to have_css('h3', text: 'Casa na praia')
    expect(page).to have_css('li', text: 'Tipo da propriedade: Casa da praia')
    expect(page).to have_css('li', text: 'Localidade: São Vicente - SP')
    expect(page).to have_css('li', text: 'Descrição: Lalala')
    expect(page).to have_css('li', text: 'Área: 100m2')
    expect(page).to have_css('li', text: 'Preço da diaria: R$ 100,00')
  end

  scenario 'and there is no properties' do
    visit root_path

    expect(page).to have_css('p', text: 'Nenhuma propriedade encontrada')
  end

  scenario 'and clicks on a property' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit root_path
    click_on 'Casa na praia'

    expect(current_path).to eq(property_path(property))
  end
end
