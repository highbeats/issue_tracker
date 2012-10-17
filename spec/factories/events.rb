# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    target_id 1
    ticket_id 1
    content "MyString"
  end
end
