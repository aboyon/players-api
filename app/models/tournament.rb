class Tournament < ActiveRecord::Base

  has_many :team_tournaments
  has_many :teams, :through => :team_tournaments

  validates_presence_of :name
  validates :year, :numericality => { :only_integer => true }

  def ended?
    year < Time.now.year
  end

  def champion
    @champion||= team_tournaments.find_by(:position => 1).try(:team)
  end
end