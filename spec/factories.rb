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
  
  factory :position do
    name "Outfield"
    abbreviation "OF"
  end

  factory :player do
    name "Nate Jones"
    moniker "Nasty"
    position
  end
  
  factory :stat do
    name "At Bats"
    abbreviation "AB"
  end  
  
  factory :box do
    player
    game
    stat
    value 1
  end  
  
end