FactoryBot.define do
  factory :order_address do
    token                    {"tok_abcdefghijk000000000000"}
    postal_code              {"564-0073"}
    delivery_prefecture_id   {3}
    municipality             {"テスト"}
    house_number             {"青山1-1"}
    building_name            {"ヒルズ"}
    phone_number             {"09012345678"}
  end
end
