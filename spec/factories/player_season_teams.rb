FactoryGirl.define do
  factory :player_season_team do
    association :player,  :factory => :player
    association :team,    :factory => :team
    season 2015
    start_at "2015-07-15"
    end_at "2017-07-15"
    active true
  end

end
