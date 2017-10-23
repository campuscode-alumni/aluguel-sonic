require 'rails_helper'

feature 'owner accepts proposal' do
  scenario 'accepted one proposal and recuse all others' do
    property = Property.create(property_location: 'Rio de Janeiro',
                               area: '100m2', title: 'Casa na praia',
                               description: 'Casa na praia em copacabana',
                               daily_rate: 200, rooms: 5,
                               minimum_rent_days: 2, maximum_rent_days: 5,
                               photo: 'casa.png', maximum_occupancy: 5,
                               usage_rules: 'sem animais',
                               property_type: 'praia')

    proposal1 = Proposal.create(user_name: 'Nailson_Ita',
                                email: 'nailson.ita@ita.com',
                                start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                rent_purpose: 'Casamento',
                                agree_with_rules: true,
                                total_amount: 600,
                                total_guests: 5,
                                status: 0,
                                property: property)

    proposal2 = Proposal.create(user_name: 'Nailson_Ita',
                                email: 'nailson.ita@ita.com',
                                start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                rent_purpose: 'Casamento',
                                agree_with_rules: true,
                                total_amount: 600,
                                total_guests: 5,
                                status: 0,
                                property: property)


    visit proposal_path(proposal2)
    click_on 'Aceitar proposta'
    proposal1.reload
    proposal2.reload

    expect(page).to have_css('h1', text: 'Detalhes da proposta')
    expect(page).to have_css('h2', text: proposal2.property.title)
    expect(page).to have_css('p', text: '16/10/2017')
    expect(page).to have_css('p', text: '19/10/2017')
    expect(page).to have_css('p', text: 600)
    expect(page).to have_css('p', text: 5)
    expect(page).to have_css('p', text: 'accepted')

    expect(proposal1.rejected?).to eq true
    expect(proposal2.accepted?).to eq true

  end
end