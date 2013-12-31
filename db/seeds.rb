# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Gameresult.create(name: 'Win', abbreviation: 'W')
Gameresult.create(name: 'Loss', abbreviation: 'L')
Gameresult.create(name: 'Draw', abbreviation: 'D')

Gamesite.create(name: 'Home', abbreviation: 'H')
Gamesite.create(name: 'Away', abbreviation: 'A')
Gamesite.create(name: 'Neutral', abbreviation: 'N')

Position.create(name: 'Pitcher', abbreviation: 'P')
Position.create(name: 'Catcher', abbreviation: 'C')
Position.create(name: 'First Baseman', abbreviation: '1B')
Position.create(name: 'Second Baseman', abbreviation: '2B')
Position.create(name: 'Third Baseman', abbreviation: '3B')
Position.create(name: 'Shortstop', abbreviation: 'SS')
Position.create(name: 'Outfielder', abbreviation: 'OF')

Stat.create(name: 'At Bats', abbreviation: 'AB', unique_identifier: 'at_bats')
Stat.create(name: 'Plate Appearances', abbreviation: 'PA', unique_identifier: 'plate_appearances')
Stat.create(name: 'Runs Batted In', abbreviation: 'RBI', unique_identifier: 'runs_batted_in')
Stat.create(name: 'Strikeouts', abbreviation: 'X', unique_identifier: 'strikeouts')
Stat.create(name: 'Singles', abbreviation: '1B', unique_identifier: 'singles')
Stat.create(name: 'Doubles', abbreviation: '2B', unique_identifier: 'doubles')
Stat.create(name: 'Triples', abbreviation: '3B', unique_identifier: 'triples')
Stat.create(name: 'Homeruns', abbreviation: 'HR', unique_identifier: 'home_runs')
Stat.create(name: 'Walks', abbreviation: 'W', unique_identifier: 'walks')
Stat.create(name: 'Scarifices', abbreviation: 'S', unique_identifier: 'sacrifices')
Stat.create(name: 'Stolen Bases', abbreviation: 'SB', unique_identifier: 'stolen_bases')