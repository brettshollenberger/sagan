# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Brad"
    last_name "Cassad"
    sequence(:email) { |n| "brettz#{n}@gmail.com" }
    password "foobar29"
  end
end
