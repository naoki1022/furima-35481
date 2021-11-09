FactoryBot.define do
  factory :item do
    name                { '写真' }
    price               { 500 }
    description         { '写真をお売りします' }
    category_id         { 2 }
    condition_id        { 2 }
    shipping_day_id     { 2 }
    shipping_cost_id    { 2 }
    shipping_place_id   { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
