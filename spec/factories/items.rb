FactoryBot.define do
  factory :item do
    name  { 'てすと' }
    explanation { 'てすと' }
    category_id { '2' }
    status_id { '2' }
    shipping_cost_payer_id { '2' }
    origin_region_id { '2' }
    days_until_shipping_id { '2' }
    sale_price { '5000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'てすと')
    end
  end
end
