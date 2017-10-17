require 'rails_helper'

feature 'user send proposal to property owner' do
  scenario 'successfully' do
    property = Property.create(title:'Casa na praia', location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path(property)
    click_on 'Enviar proposta'

    expect(page).to have_css('legend', text: 'Formulário de envio de proposta')
    fill_in 'Nome da pessoa', with: 'Fulaninho'
    fill_in 'Email', with: 'fulano@cicrano.com.br'
    fill_in 'Data inicio', with: '10/12/2017'
    fill_in 'Data fim', with: '20/12/2017'
    fill_in 'Quantidade de pessoas', with: 10
    fill_in 'Proposito da Locação', with: 'Festa'
    check 'Concordar com as regras'

    click_on 'Enviar'

    expect(page).to have_css('div.success', text: 'Proposta enviada com sucesso.')

    expect(page).to have_css('h1', text: 'Detalhes da proposta enviada')
    expect(page).to have_css('h2', text: 'Casa na praia')
    expect(page).to have_css('p', text: 'Nome da pessoa: Fulaninho')
    expect(page).to have_css('p', text: 'Email: fulano@cicrano.com.br')
    expect(page).to have_css('p', text: 'Data inicio: 10/12/2017')
    expect(page).to have_css('p', text: 'Data fim: 20/12/2017')
    expect(page).to have_css('p', text: 'Quantidade de pessoas: 10')
    expect(page).to have_css('p', text: 'Proposito da Locação: Festa')
    expect(page).to have_css('p', text: 'Valor total: R$ 1000,00')
    expect(page).to have_css('a', text: 'Voltar')
  end

  scenario 'and don\'t agree with rules' do
    property = Property.create(title:'Casa na praia', location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path(property)
    click_on 'Enviar proposta'

    expect(page).to have_css('legend', text: 'Formulário de envio de proposta')
    fill_in 'Nome da pessoa', with: 'Fulaninho'
    fill_in 'Email', with: 'fulano@cicrano.com.br'
    fill_in 'Data inicio', with: '10/12/2017'
    fill_in 'Data fim', with: '20/12/2017'
    fill_in 'Quantidade de pessoas', with: 10
    fill_in 'Proposito da Locação', with: 'Festa'
    click_on 'Enviar'

    expect(page).to have_css('div.error', text: 'Você deve estar de acordo com as regras')
  end

  scenario 'and fill required inputs' do
    property = Property.create(title:'Casa na praia', location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path(property)
    click_on 'Enviar proposta'

    expect(page).to have_css('legend', text: 'Formulário de envio de proposta')
    fill_in 'Nome da pessoa', with: ''
    fill_in 'Email', with: ''
    fill_in 'Data inicio', with: ''
    fill_in 'Data fim', with: ''
    fill_in 'Quantidade de pessoas', with: ''
    fill_in 'Proposito da Locação', with: ''
    check 'Concordar com as regras'
    click_on 'Enviar'

    expect(page).to have_css('div.error', text: 'Você deve preencher todos os campos')
  end
end
