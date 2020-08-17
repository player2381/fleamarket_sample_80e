FactoryBot.define do

    factory :production do
      name  {"こここ"}
      price  {"3000"}
      introduction  {"おおおお"}
      size {"s"}
      shipping_charge  {"着払い(購入者負担)"}
      prefecture_code  {"北海道"}
      detail_date  {"2~3日で発送"}
      trading_status  {"やや傷汚れあり"}
      association :user
      association :category
      after(:build) do |built_production|
        built_production.images << FactoryBot.build(:image, production: built_production)
      end  
    end

  
  end