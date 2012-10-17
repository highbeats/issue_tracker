# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    customer "MyString"
    uid "MyString"
    email "MyString"
    subject "MyString"
    question "MyText"
    status "MyString"
    manager_id 1
    department_id 1
  end
end
