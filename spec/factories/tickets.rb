# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    customer "Rem Quadriga"
    email "remquad@quadrem.com"
    subject "Something must be wrong"
    question "What happened?"
    department_id { FactoryGirl.create(:department) }
  end
end
