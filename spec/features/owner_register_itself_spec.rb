require 'rails_helper'
include ActionView::Helpers::NumberHelper

feature 'Owner register itself' do
  scenario 'and registers himself' do
    visit root_path

    click_on 'Cadastrar'

    fill_in 'Nome', with: 'Maria Antonieta'
    fill_in 'CPF', with: '40123225295'
    fill_in 'Email', with: 'owner@teste.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'

    within 'div.actions' do
      click_on 'Cadastrar'
    end

    expect(page).to have_css('.success', text: 'Bem vindo! Você realizou seu registro com sucesso.')
  end

  scenario 'and sees all received proposals' do
    owner = create(:owner)
    property = create(:property, owner: owner)

    proposal_1 = create(:proposal, property: property)
    proposal_2 = create(:proposal, email: 'ale@ale.com.br', property: property)

    visit new_owner_session_url

    fill_in 'Email', with: owner.email
    fill_in 'Senha', with: owner.password

    within 'div.actions' do
      click_on 'Entrar'
    end

    click_on 'Minhas propostas'

    expect(page).to have_css('dd', text: proposal_1.email)
    expect(page).to have_css('dd', text: I18n.localize(proposal_1.start_date))
    expect(page).to have_css('dd', text: I18n.localize(proposal_1.end_date))
    expect(page).to have_css('dd', text: proposal_1.total_guests)
    expect(page).to have_css('dd', text: proposal_1.rent_purpose)
    expect(page).to have_css('dd', text: number_to_currency(proposal_1.total_amount))
    expect(page).to have_css('dd', text: proposal_1.status)

    expect(page).to have_css('dd', text: proposal_2.email)
    expect(page).to have_css('dd', text: I18n.localize(proposal_2.start_date))
    expect(page).to have_css('dd', text: I18n.localize(proposal_2.end_date))
    expect(page).to have_css('dd', text: proposal_2.total_guests)
    expect(page).to have_css('dd', text: proposal_2.rent_purpose)
    expect(page).to have_css('dd', text: number_to_currency(proposal_2.total_amount))
    expect(page).to have_css('dd', text: proposal_2.status)
  end
end
