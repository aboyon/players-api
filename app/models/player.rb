class Player < ActiveRecord::Base
  validates_presence_of :name, :dob, :nationality
  validate :older_than_18_years?, :if => :dob?

  has_many :player_season_teams
  has_many :teams, :through => :player_season_teams

  def current_team
    player_season_teams
      .where("start_at <= ?", DateTime.now)
      .where("end_at   >= ?", DateTime.now)
      .where("active = ?", true)
      .first.try(:team)
  end

  def previous_teams
    player_season_teams.where(:active => 0).map(&:team)
  end

  protected
  def older_than_18_years?
    errors.add(:too_younger, 'Player must be older than 18 years') if (self.dob > 18.years.ago)
  end
end