require 'rails_helper'

feature 'visitor search property' do
  scenario 'by type get results'do
    property = Property.create(property_location: 'Rio de Janeiro',
                              property_type: 'Praia',
                              area: '100m2', title: 'Casa na praia',
                              description: 'Casa grande e bonita na praia',
                              daily_rate: 500, rooms: 5, minimum_rent_days: 2,
                              maximum_rent_days: 5, photo: 'casa.jpg',
                              maximum_occupancy: 10, usage_rules: 'Sem animais')

    visit root_path

    fill_in 'Buscar', with: 'Praia'
    click_on 'Buscar'

    expect(page).to have_content("Você buscou por Praia")
    expect(page).to have_css('h2', text: property.property_type)
    expect(page).to have_css('dd', text: property.property_location)
    expect(page).to have_css('dd', text: property.area)
    expect(page).to have_css('dd', text: property.description)
    expect(page).to have_css('dd', text: property.daily_rate)
    expect(page).to have_css('p', text: "De #{property.minimum_rent_days} Ate #{property.maximum_rent_days}")
    expect(page).to have_css('dd', text: property.photo)
    expect(page).to have_css('dd', text: property.maximum_occupancy)
    expect(page).to have_css('dd', text: property.rooms)
    expect(page).to have_css('dd', text: property.usage_rules)
    expect(page).to have_css('dd', text: property.title)
  end

  scenario 'by location get results'do
    property = Property.create(property_location: 'Minas Gerais',
                              property_type: 'Sitio',
                              area: '100m2', title: 'Casa em campo',
                              description: 'Casa grande',
                              daily_rate: 500, rooms: 5, minimum_rent_days: 2,
                              maximum_rent_days: 5, photo: 'casa.jpg',
                              maximum_occupancy: 10, usage_rules: 'Sem animais')

    visit root_path

    fill_in 'Buscar', with: 'Minas Gerais'
    click_on 'Buscar'

    expect(page).to have_content("Você buscou por Minas Gerais")
    expect(page).to have_css('h2', text: property.property_type)
    expect(page).to have_css('dd', text: property.property_location)
    expect(page).to have_css('dd', text: property.area)
    expect(page).to have_css('dd', text: property.description)
    expect(page).to have_css('dd', text: property.daily_rate)
    expect(page).to have_css('p', text: "De #{property.minimum_rent_days} Ate #{property.maximum_rent_days}")
    expect(page).to have_css('dd', text: property.photo)
    expect(page).to have_css('dd', text: property.maximum_occupancy)
    expect(page).to have_css('dd', text: property.rooms)
    expect(page).to have_css('dd', text: property.usage_rules)
    expect(page).to have_css('dd', text: property.title)
  end

  scenario 'by location and type get results'do
    property = Property.create(property_location: 'Praia',
                              property_type: 'Praia',
                              area: '100m2', title: 'Casa em campo',
                              description: 'Casa grande',
                              daily_rate: 500, rooms: 5, minimum_rent_days: 2,
                              maximum_rent_days: 5, photo: 'casa.jpg',
                              maximum_occupancy: 10, usage_rules: 'Sem animais')

    visit root_path

    fill_in 'Buscar', with: 'Praia'
    click_on 'Buscar'

    expect(page).to have_content("Você buscou por Praia")
    expect(page).to have_css('h2', text: property.property_type)
    expect(page).to have_css('dd', text: property.property_location)
    expect(page).to have_css('dd', text: property.area)
    expect(page).to have_css('dd', text: property.description)
    expect(page).to have_css('dd', text: property.daily_rate)
    expect(page).to have_css('p', text: "De #{property.minimum_rent_days} Ate #{property.maximum_rent_days}")
    expect(page).to have_css('dd', text: property.photo)
    expect(page).to have_css('dd', text: property.maximum_occupancy)
    expect(page).to have_css('dd', text: property.rooms)
    expect(page).to have_css('dd', text: property.usage_rules)
    expect(page).to have_css('dd', text: property.title)
  end

  scenario 'and has no results' do
    property = Property.create(property_location: 'Rio de Janeiro',
                              property_type: 'Praia',
                              area: '100m2', title: 'Casa na praia',
                              description: 'Casa grande e bonita na praia',
                              daily_rate: 500, rooms: 5, minimum_rent_days: 2,
                              maximum_rent_days: 5, photo: 'casa.jpg',
                              maximum_occupancy: 10, usage_rules: 'Sem animais')


   visit root_path

   fill_in 'Buscar', with: 'Sitio'
   click_on 'Buscar'

   expect(page).not_to have_content(property.property_type)
   expect(page).to have_content('Nenhum imóvel encontrado')
  end
end
