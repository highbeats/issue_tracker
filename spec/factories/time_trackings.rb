# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_tracking do
    manager_id 1
    task_id 1
    started "2012-11-09 19:56:07"
    stopped_at "2012-11-09 19:56:07"
    total_time 1
  end
end
