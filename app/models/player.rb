class Player < ActiveRecord::Base
  validates_presence_of :name, :dob, :nationality
  validate :older_than_18_years?, :if => :dob?

  protected
  def older_than_18_years?
  	errors.add(:visitor_team, 'Player must be older than 18 years') if (self.dob > 18.years.ago)
  end
end