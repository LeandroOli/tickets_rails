# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agent_profile do
    company
    company_manager true
  end
end
