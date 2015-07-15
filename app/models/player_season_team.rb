class PlayerSeasonTeam < ActiveRecord::Base
  belongs_to :player
  belongs_to :team

  validate :contract_dates

  before_create :set_previous_contract_as_inactive

  def ended?
    end_at <= Time.now
  end

  protected
  def contract_dates
    errors.add(:contract_dates_wrong, "Contract end date must be greater than start date") if end_at < start_at
  end

  def set_previous_contract_as_inactive
    self.class.where(:player_id => player_id).update_all("active = 0, end_at = '#{DateTime.now}'")
  end
end
