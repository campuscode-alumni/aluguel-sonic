FactoryBot.define do
  factory :property do
    area 150
    title 'Casa de frente pro mar'
    description 'É uma casa na praia muito cara'
    daily_rate '200'
    rooms 4
    minimum_rent_days 2
    maximum_rent_days 8
    photo { File.new("#{Rails.root}/spec/image/casa.jpg") }
    maximum_occupancy 8
    usage_rules 'Não pode cachorro'
    property_location 'Santos, São Paulo'
    property_type 'Casa na praia'
  end
end
