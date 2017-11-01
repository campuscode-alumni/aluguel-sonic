require 'rails_helper'

feature 'User register itself' do
  scenario 'And logs in' do

    user = User.create(email: 'user@user.com', password: '10203040')

    visit root_path

    click_on 'Entrar como Usuário'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(page).to have_css('.success', "Bem vindo(a)")

  end
end
