FactoryGirl.define do
  factory :team do
    sequence :name do |n|
      "Team Name #{n}"
    end
  end
end
