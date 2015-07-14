json.(team, :name, :id)
json.honours do
  json.array! team.honours, partial: 'api/v1/teams/honours', :as => :tournament
end