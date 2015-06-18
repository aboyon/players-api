FactoryGirl.define do
  factory :tournament do
    sequence :name do |n|
      "Tournament Name #{n}"
    end
  end
end
