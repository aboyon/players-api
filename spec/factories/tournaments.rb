FactoryGirl.define do
  factory :tournament do
    sequence :name do |n|
      "Tournament Name #{n}"
    end
    year (1990..2020).to_a.sample
  end
end
