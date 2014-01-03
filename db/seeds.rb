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

Stat.create(name: 'At Bats', abbreviation: 'AB', unique_identifier: 'at_bats', stat_type: 'raw')
Stat.create(name: 'Plate Appearances', abbreviation: 'PA', unique_identifier: 'plate_appearances', stat_type: 'raw')
Stat.create(name: 'Runs Batted In', abbreviation: 'RBI', unique_identifier: 'runs_batted_in', stat_type: 'raw')
Stat.create(name: 'Strikeouts', abbreviation: 'K', unique_identifier: 'strikeouts', stat_type: 'raw')
Stat.create(name: 'Singles', abbreviation: '1B', unique_identifier: 'singles', stat_type: 'raw')
Stat.create(name: 'Doubles', abbreviation: '2B', unique_identifier: 'doubles', stat_type: 'raw')
Stat.create(name: 'Triples', abbreviation: '3B', unique_identifier: 'triples', stat_type: 'raw')
Stat.create(name: 'Homeruns', abbreviation: 'HR', unique_identifier: 'home_runs', stat_type: 'raw')
Stat.create(name: 'Walks', abbreviation: 'BB', unique_identifier: 'walks', stat_type: 'raw')
Stat.create(name: 'Scarifices', abbreviation: 'SAC', unique_identifier: 'sacrifices', stat_type: 'raw')
Stat.create(name: 'Stolen Bases', abbreviation: 'SB', unique_identifier: 'stolen_bases', stat_type: 'raw')
Stat.create(name: 'Hits', abbreviation: 'H', unique_identifier: 'hits', stat_type: 'calculated', formula: '{"function":"SUM", "stats":["singles", "doubles", "triples", "home_runs"]}')
Stat.create(name: 'Batting Average', abbreviation: 'AVG', unique_identifier: 'batting_average', stat_type: 'calculated', formula: '{"function":"DIV", "stats":["hits", "at_bats"]}')