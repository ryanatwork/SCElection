# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    precinct_id 1
    candidate_id 1
    votes 1
  end
end
