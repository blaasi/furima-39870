FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    origin_region_id { 3 }
    city { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
  end
end
