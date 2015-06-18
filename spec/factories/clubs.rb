FactoryGirl.define do
  factory :club do
    sequence :name do |n|
      "Club Name #{n}"
    end
  end
end
