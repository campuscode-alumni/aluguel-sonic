require 'rails_helper'

feature 'owner accepts proposal' do
  scenario 'successfuly' do

    proposal1 = Proposal.create(start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                total_amount: 'R$600,00',
                                total_guets: 5,
                                status: 'Pendente')

    proposal2 = Proposal.create(start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                total_amount: 'R$600,00',
                                total_guets: 10,
                                status: 'Pendente')

    proposal3 = Proposal.create(start_date: '16/10/2017',
                                end_date: '19/10/2017',
                                total_amount: 'R$600,00',
                                total_guets: 4,
                                status: 'Pendente')

    visit property_proposals_path proposal2

    expect(page).to have_css('dd', text: proposal2.start_date)
    expect(page).to have_css('dd', text: proposal2.end_date)
    expect(page).to have_css('dd', text: proposal2.total_amount)
    expect(page).to have_css('dd', text: proposal2.total_guets)
    expect(page).to have_css('dd', text: proposal2.status)

    click_on 'Aceitar proposta'
  end
end
