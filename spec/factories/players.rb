FactoryGirl.define do
  factory :player do
    name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    dob 20.years.ago
    nationality %w(ARG US BR ESP CHI).sample
  end
end
