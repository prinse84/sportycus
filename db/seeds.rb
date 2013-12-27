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