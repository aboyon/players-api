FactoryGirl.define do
  factory :player_match do
    association :player,  :factory => :player
    association :match,   :factory => :match
  end

end
