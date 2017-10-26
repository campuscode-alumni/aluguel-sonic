require 'rails_helper'

feature 'visitor interacts with menu' do
  scenario 'and click on register property' do
    visit root_path
    within 'nav' do
      click_on 'Cadastrar imóvel'
    end
    expect(current_path).to eq(new_property_path)
  end

  scenario 'and click brand name to return to index' do
    visit new_property_path
    within 'nav' do
      click_on 'Aluga Temporada'
    end

    expect(current_path).to eq(root_path)
  end
end
