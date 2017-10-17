require 'rails_helper'

feature 'owner accepts proposal' do
  scenario 'successfuly' do

    proposal1 = Proposal.create(start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                total_amount: 600,
                                total_guets: 5,
                                status: 'pending',
                                property: property)

    proposal2 = Proposal.create(start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                total_amount: 600,
                                total_guets: 10,
                                status: 'pending',
                                property: property)

    proposal3 = Proposal.create(start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                total_amount: 600,
                                total_guets: 4,
                                status: 'pending',
                                property: property)

    visit property_proposals_path(proposal2)
    click_on 'Aceitar proposta'

    expect(page).to have_content('Proposta aceita')
    expect(page).to have_css('h2', text: 'Detalhes da proposta aceita')
    expect(page).to have_css('dd', text: proposal2.property.name)
    expect(page).to have_css('dd', text: '16/10/2017')
    expect(page).to have_css('dd', text: '19/10/2017')
    expect(page).to have_css('dd', text: 600)
    expect(page).to have_css('dd', text: 5)
    expect(page).to have_css('dd', text: 'accepts')

  end
end
