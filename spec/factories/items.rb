FactoryBot.define do
  factory :item do
    name                     {"test"}
    introduction             {"test"}
    category_id              {3}
    state_id                 {3}
    delivery_price_id        {3}
    delivery_prefecture_id   {3}
    delivery_day_id          {3}
    price                    {900}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
