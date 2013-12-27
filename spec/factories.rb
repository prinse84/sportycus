FactoryGirl.define do
  factory :season do
    sequence(:title)  { |n| "Fall #{n}" }
    sequence(:description) { |n| "The #{title} season"}
  end
  
  factory :game do
    opponent "Lorem ipsum"
    season
    gameresult
    gamesite
    game_date 2.days.ago
    team_runs 11
    opponent_team_runs 5
  end
  
  factory :gameresult do
    name "Win"
    abbreviation "W"
  end
  
  factory :gamesite do
    name "Home"
    abbreviation "H"
  end
  
end