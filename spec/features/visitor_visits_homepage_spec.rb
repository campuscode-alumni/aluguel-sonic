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
    expect(page).to have_css('dt', text: 'Tipo da propriedade:')
    expect(page).to have_css('dt', text: 'Localidade:')
    expect(page).to have_css('dt', text: 'Descrição:')
    expect(page).to have_css('dt', text: 'Área:')
    expect(page).to have_css('dt', text: 'Preço da diaria:')


    expect(page).to have_css('dd', text: 'Casa da praia')
    expect(page).to have_css('dd', text: 'São Vicente - SP')
    expect(page).to have_css('dd', text: 'Lalala')
    expect(page).to have_css('dd', text: '100m2')
    expect(page).to have_css('dd', text: 'R$ 100,00')
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

  scenario 'and sees unavailable periods of the property' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    period_unavailable = UnavailablePeriod.create(start_date_unavailable: '20/12/2017',
                                                  end_date_unavailable: '28/12/2017',
                                                  property: property)

    visit root_path

    expect(page).to have_css('dt', text: 'Datas indisponiveis:')
    expect(page).to have_css('dd', text: "De #{I18n.localize property.unavailable_period.start_date_unavailable}
                                          Ate #{I18n.localize property.unavailable_period.end_date_unavailable}")
  end
end
