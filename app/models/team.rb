class Team < ActiveRecord::Base
  validates_presence_of :name
  has_many :team_tournaments
  has_many :tournaments, :through => :team_tournaments

  def honours
    team_tournaments.where(:position => 1).map(&:tournament)
  end
end