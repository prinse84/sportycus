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
  end
end