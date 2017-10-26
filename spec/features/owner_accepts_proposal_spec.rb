require 'rails_helper'

feature 'owner accepts proposal' do
  scenario 'accepted one proposal and recuse all others' do
    property = create(:property, maximum_occupancy: 5, minimum_rent_days: 2,
                        maximum_rent_days: 5)
    proposal1 = create(:proposal, property: property)
    proposal2 = create(:proposal, property: property, user_name: 'Nailson_Ita2')

    visit root_path
    click_on property.title
    click_on proposal2.user_name
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

  scenario 'and sends mail' do
    proposal = create(:proposal)

    visit proposal_path(proposal)

    expect(ProposalsMailer).to receive(:accept_proposal)

    click_on 'Aceitar proposta'
  end
end
