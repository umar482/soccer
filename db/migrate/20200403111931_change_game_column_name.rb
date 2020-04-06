class ChangeGameColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :awaw_team_name, :away_team_name
  end
end
