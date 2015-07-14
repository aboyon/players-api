class TeamTournament < ActiveRecord::Base
  belongs_to :team
  belongs_to :tournament

  validates_uniqueness_of :team_id,   :scope => [:tournament_id]
  validates_uniqueness_of :position,  :scope => [:tournament_id], :if => :position?

end
