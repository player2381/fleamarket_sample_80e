FactoryBot.define do
  factory :address do
    address_first_name {"たな"}
    address_family_name {"たな"}
    address_first_name_kana {"たな"}
    address_family_name_kana {"たな"}
    post_code {"3236421"}
    prefecture_code {"3"}
    city {"3"}
    house_number {"2"}
    association :user
  end
end