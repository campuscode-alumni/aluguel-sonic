require 'rails_helper'

feature 'Owner register itself' do
  scenario 'And logs in' do

    owner = Owner.create(email: 'n@n.com.br', password: '123456789')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: owner.email
    fill_in 'Senha', with: owner.password

    within 'div.sign-in' do
      click_on 'Entrar'
    end

    expect(page).to have_css('.success', text: "Login efetuado com sucesso.")

  end
end
