namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
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
                      game_time: Time.now,
                      team_runs: 11,
                      opponent_team_runs: 6
                      )
          end
      end
  
    20.times do |n|
        name = Faker::Name.name
        moniker = Faker::Name.last_name
        position = (1..6).to_a.sample
        Player.create!(name: name, 
                      moniker: moniker,
                      position_id: position
                      )
    end
        
  end
end