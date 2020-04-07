# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

game_list = [
  [ "italy", "argentina", DateTime.now+30, 5, "ten sports", "serie a", 2200, 0, "italy.png", "argentina.png" ],
  [ "italy", "belgium", DateTime.now+31, 6, "geo sports", "serie b", 2300, 0, "italy.png", "belgium.png" ],
  [ "italy", "brazil", DateTime.now+32, 6, "ten sports", "serie a", 2200, 0, "italy.png", "brazil.png" ],
  [ "italy", "england", DateTime.now+33, 5, "geo sports", "serie b", 2300, 0, "italy.png", "england.png" ],
  [ "italy", "germany", DateTime.now+34, 4, "sony liv", "serie a", 2200, 0, "italy.png", "germany.png" ],
  [ "italy", "maxico", DateTime.now+35, 5, "geo sports", "serie b", 2400, 0, "italy.png", "maxico.png" ],
  [ "italy", "russia", DateTime.now+36, 5, "geo sports", "serie b", 2200, 0, "italy.png", "russia.png" ],
  [ "italy", "spain", DateTime.now+37, 5, "geo sports", "serie b", 2300, 0, "italy.png", "spain.png" ],
  
  [ "russia", "argentina", DateTime.now+38, 4, "sony liv", "serie a", 2500, 0, "russia.png", "argentina.png" ],
  [ "russia", "belgium", DateTime.now+39, 5, "geo sports", "serie b", 2600, 0, "russia.png", "belgium.png" ],
  [ "russia", "brazil", DateTime.now+40, 6, "ten sports", "serie a", 2300, 0, "russia.png", "brazil.png" ],
  [ "russia", "england", DateTime.now+41, 5, "geo sports", "serie c", 2700, 0, "russia.png", "england.png" ],
  [ "russia", "germany", DateTime.now+42, 5, "geo sports", "serie c", 2200, 0, "russia.png", "germany.png" ],
  [ "russia", "italy", DateTime.now+43, 5, "geo sports", "serie c", 2100, 0, "russia.png", "italy.png" ],
  [ "russia", "maxico", DateTime.now+44, 5, "geo sports", "serie c", 2900, 0, "russia.png", "maxico.png" ],
  [ "russia", "spain", DateTime.now+45, 5, "geo sports", "serie c", 3200, 0, "russia.png", "spain.png" ],

  [ "spain", "argentina", DateTime.now+46, 6, "ten sports", "serie a", 2400, 0, "spain.png", "argentina.png" ],
  [ "spain", "belgium", DateTime.now+47, 8, "sony liv", "serie c", 2500, 0, "spain.png", "belgium.png" ],
  [ "spain", "brazil", DateTime.now+48, 5, "ten sports", "serie a", 2700, 0, "spain.png", "brazil.png" ],
  [ "spain", "england", DateTime.now+49, 6, "geo sports", "serie c", 2200, 0, "spain.png", "england.png" ],
  [ "spain", "germany", DateTime.now+51, 5, "ten sports", "serie a", 2500, 0, "spain.png", "germany.png" ],
  [ "spain", "italy", DateTime.now+52, 5, "ten sports", "serie a", 2400, 0, "spain.png", "italy.png" ],
  [ "spain", "maxico", DateTime.now+53, 5, "ten sports", "serie a", 2600, 0, "spain.png", "maxico.png" ],
  [ "spain", "russia", DateTime.now+54, 5, "ten sports", "serie a", 2700, 0, "spain.png", "russia.png" ],

  [ "brazil", "argentina", DateTime.now+55, 4, "sony liv", "serie a", 2500, 0, "brazil.png", "argentina.png" ],
  [ "brazil", "belgium", DateTime.now+56, 3, "ten sports", "serie b", 2400, 0, "brazil.png", "belgium.png" ],
  [ "brazil", "england", DateTime.now+57, 6, "ten sports", "serie c", 2700, 0, "brazil.png", "england.png" ],
  [ "brazil", "germany", DateTime.now+59, 6, "ten sports", "serie c", 2500, 0, "brazil.png", "germany.png" ],
  [ "brazil", "italy", DateTime.now+60, 6, "ten sports", "serie c", 2600, 0, "brazil.png", "italy.png" ],
  [ "brazil", "maxico", DateTime.now+61, 6, "ten sports", "serie c", 2200, 0, "brazil.png", "maxico.png" ],
  [ "brazil", "russia", DateTime.now+62, 6, "ten sports", "serie c", 2300, 0, "brazil.png", "russia.png" ],

  [ "germany", "argentina", DateTime.now+63, 7, "geo sports", "serie a", 2100, 0, "germany.png", "argentina.png" ],
  [ "germany", "belgium", DateTime.now+64, 5, "ten sports", "serie d", 2300, 0, "germany.png", "belgium.png" ],
  [ "germany", "brazil", DateTime.now+65, 5, "geo sports", "serie a", 2600, 0, "germany.png", "brazil.png" ],
  [ "germany", "england", DateTime.now+66, 6, "ten sports", "serie d", 2500, 0, "germany.png", "england.png" ],
  [ "germany", "italy", DateTime.now+67, 5, "sony liv", "serie a", 2700, 0, "germany.png", "italy.png" ],
  [ "germany", "maxico", DateTime.now+68, 5, "tens sports", "serie a", 2600, 0, "germany.png", "maxico.png" ],
  [ "germany", "russia", DateTime.now+69, 5, "sony liv", "serie a", 2800, 0, "germany.png", "russia.png" ],
  [ "germany", "spain", DateTime.now+70, 5, "geo sports", "serie a", 2500, 0, "germany.png", "spain.png" ],
]

game_list.each do |home_team_name, away_team_name, date, reach, channel, league, price_per_minute, minutes_bought, home_team_logo, away_team_logo|
  Game.create(
    home_team_name: home_team_name,
    away_team_name: away_team_name,
    date: date,
    reach: reach,
    channel: channel,
    league: league,
    price_per_minute: price_per_minute,
    minutes_bought: minutes_bought,
    home_team_logo: home_team_logo,
    away_team_logo: away_team_logo
  )
end


