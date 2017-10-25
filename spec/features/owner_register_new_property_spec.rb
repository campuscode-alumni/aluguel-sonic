require 'rails_helper'

feature 'owner register new property' do
  scenario 'successfuly' do
    visit root_path
    click_on 'Anunciar um imóvel'

    fill_in 'Nome', with: 'Casa de frente pro mar'
    fill_in 'Local', with: 'Santos, São Paulo'
    fill_in 'Tamanho (m2)', with: '150'
    fill_in 'Tipo do Imóvel', with: 'Casa na praia'
    fill_in 'Quantidade de quartos', with: 4
    fill_in 'Máximo de pessoas', with: 8
    fill_in 'Mínimo de dias para locação', with: 2
    fill_in 'Máximo de dias para locação', with: 8
    fill_in 'Valor padrão da diária', with: 200

    attach_file 'Foto', "#{Rails.root}/spec/image/casa.jpg"
    fill_in 'Descrição', with: 'É uma casa na praia muito cara'
    fill_in 'Regras de uso', with: 'Não pode cachorro'
    click_on 'Enviar'

    expect(page).to have_css('h1', text:'Casa de frente pro mar')
    expect(page).to have_css('p', text: 'Descrição: É uma casa na praia muito cara')
    expect(page).to have_css('p', text: 'Localidade: Santos, São Paulo')
    expect(page).to have_css('h2', text: 'Detalhes')

    expect(page).to have_css('dt', text: 'Tamanho')
    expect(page).to have_css('dt', text: 'Tipo do imóvel')
    expect(page).to have_css('dt', text: 'Quantidade de quartos')
    expect(page).to have_css('dt', text: 'Máximo de pessoas')
    expect(page).to have_css('dt', text: 'Mínimo de dias para locação')
    expect(page).to have_css('dt', text: 'Máximo de dias para locação')
    expect(page).to have_css('dt', text: 'Valor padrão da diária')
    expect(page).to have_css('dt', text: 'Valor atual da diária')
    expect(page).to have_css('dt', text: 'Regras de uso')


    expect(page).to have_css('dd', text: '150 m2')
    expect(page).to have_css('dd', text: 'Casa na praia')
    expect(page).to have_css('dd', text: '4')
    expect(page).to have_css('dd', text: '8')
    expect(page).to have_css('dd', text: '2')
    expect(page).to have_css('dd', text: '8')
    expect(page).to have_css('dd', text: 'R$ 200,00')
    expect(page).to have_css('dd', text: 'R$ 200,00')
    expect(page).to have_css('dd', text: 'Não pode cachorro')

    expect(page).to have_css('h3', text: 'Foto do local')
    expect(page).to have_xpath("//img[contains(@src,'casa.jpg')]")

    expect(page).to have_css('div.success', text:'Imóvel cadastrado com sucesso!')
  end

  scenario 'and must fill all required fields' do
    visit root_path
    click_on 'Anunciar um imóvel'

    fill_in 'Nome', with: ''
    fill_in 'Local', with: ''
    fill_in 'Tamanho (m2)', with: '150'
    fill_in 'Tipo do Imóvel', with: ''
    fill_in 'Quantidade de quartos', with: 4
    fill_in 'Máximo de pessoas', with: 8
    fill_in 'Mínimo de dias para locação', with: 2
    fill_in 'Máximo de dias para locação', with: 8
    fill_in 'Valor padrão da diária', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Regras de uso', with: 'Não pode cachorro'
    click_on 'Enviar'

    expect(page).to have_css('div.error', text:'Você deve preencher os campos obrigatórios')
  end
end
