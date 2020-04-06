class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :home_team_name
      t.string :awaw_team_name
      t.datetime :date
      t.integer :reach
      t.string :channel
      t.string :league
      t.integer :price_per_minute
      t.integer :minutes_bought
      t.string :home_team_logo
      t.string :away_team_logo

      t.timestamps
    end
  end
end
