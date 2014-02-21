# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name  { Faker::Name.name }
    subdomain { Faker::Internet.domain_word }
  end
end
