FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
    name { Faker::Name.name }

    factory :admin_user do
      association :profile,  factory: :admin_profile
    end

    factory :agent_user do
      association :profile, factory: :agent_profile
    end
  end
end