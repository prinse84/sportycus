namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Season.create!(title: "Fall 2005",
                  description: "The Fall 2005 Season"
                 )
    20.times do |n|
      #title  = Faker::Name.name
      title = "Fall 20#{n+1}"
      description = "The #{title} Season"
      Season.create!(title: title,
                   description: description
                   )
    end
    
    seasons = Season.all(limit: 6)
    gamedate = 1.year.ago
      10.times do
        opponent = Faker::Lorem.word
        seasons.each do |season| 
          gamedate = gamedate + 1.week
          season.games.create!(opponent: opponent, 
                      gameresult_id: 1,
                      gamesite_id: 1,
                      game_date: gamedate,
                      game_time: Time.now
                      )
          end
      end
  end
end