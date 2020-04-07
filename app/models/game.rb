class Game < ApplicationRecord
  validate :diff_team_names

  private

  def diff_team_names
    errors.add(:away_team_name, 'You cannot add home team as away team also.') if home_team_name == away_team_name
  end
end
