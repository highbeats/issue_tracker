# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    in_progress false
    manager { FactoryGirl.create(:manager) }
  end
end
