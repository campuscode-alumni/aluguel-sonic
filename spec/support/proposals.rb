FactoryBot.define do
  factory :proposal do
    user_name 'Nailson_Ita'
    email 'nailson.ita@ita.com'
    start_date '16/10/2017'
    end_date '19/10/2017'
    rent_purpose 'Casamento'
    agree_with_rules true
    total_amount 600
    total_guests 5
    status 0
    property
  end
end
