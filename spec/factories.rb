FactoryBot.define do

  factory :company do
    name "Panda Company Inc."
  end

  factory :category do
    title "Panda Grooming"
  end

  factory :job do
    sequence(:title) { |n| "Title #{n}" }
    description "We pet them and show them love"
    city "Arizona"
    level_of_interest 90
    company
    category 
  end

end
