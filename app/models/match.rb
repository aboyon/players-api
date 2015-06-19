class Match < ActiveRecord::Base
  belongs_to :local_team, :class => Team
  belongs_to :visitor_team,  :class => Team
  validate :not_same_team

  protected
  def not_same_team
    errors.add(:visitor_team, 'Visitor team can\'t be equal than local team.') if (local_team_id == visitor_team_id)
  end
end
