FactoryGirl.define do
  factory :player do
    name "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    dob (DateTime.now - 20.years)
    nationality %w(ARG US BR ESP CHI).sample
  end
end
