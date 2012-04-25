# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :precinct do
    number 1
    description "Santa Clarita Library"
    location "12345 Main Street"
  end
end
