FactoryGirl.define do
  factory :team_tournament do
    association :team, :factory => :team
    association :tournament, :factory => :tournament
  end

end
