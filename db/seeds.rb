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