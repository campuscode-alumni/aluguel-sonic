require 'rails_helper'

feature 'Owner logs in' do
  scenario 'successfully' do
    owner = create(:owner)

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: owner.email
    fill_in 'Senha', with: owner.password

    within 'div.actions' do
      click_on 'Entrar'
    end

    expect(page).to have_css('.success', text: 'Login efetuado com sucesso.')
  end

  scenario 'and clicks on logout and backs home' do
    owner = create(:owner)
    login_as(owner)

    visit root_path

    click_on 'Sair'

    expect(current_path).to eq(root_path)
    expect(page).to have_css('.success', text: 'Logout efetuado com sucesso')
  end

  # usuario e senha erradas
end
