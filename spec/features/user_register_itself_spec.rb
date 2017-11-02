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
    expect(page).not_to have_content 'Entrar como Usuário'
    expect(page).to have_link 'Sair'

  end
  scenario 'and list proposals' do
    logged_user = User.create(email: 'user@user.com', password: '10203040')
    other_user = User.create(email: 'user2@user.com', password: '12345678')
    property = create(:property, maximum_occupancy: 5, minimum_rent_days: 2,
                        maximum_rent_days: 5)
    proposal = create(:proposal, property: property, user: logged_user)
    other_proposal = create(:proposal, property: property, user: other_user,
                            start_date: '16/11/2017', end_date: '20/11/2017',
                            total_guests: 4)

    visit root_path
    click_on 'Entrar como Usuário'
    fill_in 'Email', with: logged_user.email
    fill_in 'Senha', with: logged_user.password
    click_on 'Entrar'

    expect(page).to have_css('h3', text: 'Minhas Propostas')
    expect(page).to have_css('h4', text: proposal.property.title)
    expect(page).to have_css('p', text: proposal.start_date)
    expect(page).to have_css('p', text: proposal.end_date)
    expect(page).to have_css('p', text: proposal.total_amount.to_f)
    expect(page).to have_css('p', text: proposal.total_guests)

    expect(page).not_to have_css('p', text: other_proposal.start_date)
    expect(page).not_to have_css('p', text: other_proposal.end_date)
    expect(page).not_to have_css('p', text: other_proposal.total_amount.to_f)
    expect(page).not_to have_css('p', text: other_proposal.total_guests)

  end
end
