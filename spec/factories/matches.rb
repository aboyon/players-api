FactoryGirl.define do
  factory :match do
    date  Time.now + 1.week
    association :local_team, :factory => :team
    association :visitor_team, :factory => :team
  end

end
