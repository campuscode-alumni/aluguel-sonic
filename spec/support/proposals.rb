FactoryBot.define do
  factory :proposals do
    user_name 'João Almeida'
    email 'joaoalmeida@gmail.com'
    start_date '15/12/2017'
    end_date '20/12/2017'
    total_amount 1000
    total_guests 6
    rent_purpose 'Passeio de família'
    property
    agree_with_rules true
    status 'pending'
  end
end
