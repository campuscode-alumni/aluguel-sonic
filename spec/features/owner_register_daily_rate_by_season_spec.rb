require 'rails_helper'

feature 'owner register daily rate by season' do
  scenario 'succesfully' do
    property = Property.create(title:'Casa na praia', property_location:'São Vicente - SP',
                                area:'100', description:'Lalala', daily_rate:100,
                                rooms:2, minimum_rent_days:5,
                                maximum_rent_days:10, photo:'/mi.jpg',
                                maximum_occupancy:20, usage_rules:'no dogs',
                                property_type:'Casa da praia')

    visit property_path property
    click_on 'Cadastrar preço especifico para uma temporada'

  end
end
