FactoryBot.define do

  factory :company do
    sequence(:name) { |n| "Panda Company Inc. Number #{n}"}
  end

  factory :category do
    sequence(:title) { |n| "Number #{n} Panda Grooming"}
  end

  factory :job do
    sequence(:title) { |n| "Title #{n}" }
    description "We pet them and show them love"
    city "Arizona"
    level_of_interest 90
    company
    category
  end

  factory :comment do
    sequence(:body) { |n| "I can count to #{n}" }
    job
  end

  factory :contact do
    full_name "Garfunkle Davenport IV Esq."
    position "Emissary of the Red Panda Association"
    sequence(:email) { |n| "royalpandas#{n}@hotmail.com"}
    association company
  end
end
