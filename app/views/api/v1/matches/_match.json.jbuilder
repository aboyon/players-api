json.(match, :date)
json.local do
  json.name match.local_team.name
  json.id match.local_team_id
end
json.visitor do
  json.name match.visitor_team.name
  json.id match.visitor_team_id
end