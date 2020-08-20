FactoryBot.define do
    factory :user do
      name {"こす"}
      email {"kosu@gmail.com"}
      password {"9090909"}
      password_confirmation {"9090909"}
      birth_date {"1989-01-01"}
    end
  end