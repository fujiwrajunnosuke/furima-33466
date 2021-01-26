FactoryBot.define do
  factory :user do
    name                   {"jun"}
    email                  {Faker::Internet.free_email}
    password               {"jun0529"}
    password_confirmation  {"jun0529"}
    family_name            {"藤原"}
    first_name             {"惇之祐"}
    call_family_name       {"フジワラ"}
    call_first_name        {"ジュンノスケ"}
    birth_day              {"19970529"}
  end
end