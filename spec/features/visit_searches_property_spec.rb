require 'rails_helper'

feature 'visitor search property' do
  scenario 'by type get results'do
    property = create(:property, property_type: 'Praia')

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
    expect(page).to have_css('dd', text: property.maximum_occupancy)
    expect(page).to have_css('dd', text: property.rooms)
    expect(page).to have_css('dd', text: property.usage_rules)
    expect(page).to have_css('dd', text: property.title)
    expect(page).to have_css('h3', text: 'Foto do local')
    expect(page).to have_xpath("//img[contains(@src,'casa.jpg')]")
  end

  scenario 'by location get results'do
    property = create(:property, property_location: 'Minas Gerais')

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
    expect(page).to have_css('dd', text: property.maximum_occupancy)
    expect(page).to have_css('dd', text: property.rooms)
    expect(page).to have_css('dd', text: property.usage_rules)
    expect(page).to have_css('dd', text: property.title)
    expect(page).to have_css('h3', text: 'Foto do local')
    expect(page).to have_xpath("//img[contains(@src,'casa.jpg')]")
  end

  scenario 'by location and type get results'do
    property = create(:property, property_location: 'Praia',
                        property_type: 'Praia')

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
    expect(page).to have_css('dd', text: property.maximum_occupancy)
    expect(page).to have_css('dd', text: property.rooms)
    expect(page).to have_css('dd', text: property.usage_rules)
    expect(page).to have_css('dd', text: property.title)
    expect(page).to have_css('h3', text: 'Foto do local')
    expect(page).to have_xpath("//img[contains(@src,'casa.jpg')]")
  end

  scenario 'and has no results' do
    property = create(:property, property_location: 'Santos',
                        property_type: 'Praia')


   visit root_path

   fill_in 'Buscar', with: 'Sitio'
   click_on 'Buscar'

   expect(page).not_to have_content(property.property_type)
   expect(page).to have_content('Nenhum imóvel encontrado')
  end
end
