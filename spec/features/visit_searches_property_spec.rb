require 'rails_helper'

feature 'search property' do
  scenario 'search property by type get results'do
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

    expect(page).to have_content("Você buscou por #{property.property_type}")
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
end
