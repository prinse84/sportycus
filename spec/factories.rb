FactoryGirl.define do
  factory :season do
    sequence(:title)  { |n| "Fall #{n}" }
    sequence(:description) { |n| "The #{title} season"}
  end
end