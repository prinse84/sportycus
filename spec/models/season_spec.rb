require 'spec_helper'

describe Season do
  before { @season = Season.new(title: "Fall 2005", description: "Fall 2005 Season") }
  subject { @season }
    
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:games) }
    it { should be_valid }
    
    describe "when title is not present" do
      before { @season.title = " " }
      it { should_not be_valid }
    end
    
    describe "games associations" do
      before { @season.save }
      let!(:older_games) do
        FactoryGirl.create(:game, season: @season, game_date: 2.days.ago)
      end
      let!(:newer_games) do
        FactoryGirl.create(:game, season: @season, game_date: 1.day.ago)
      end
        
      it "should have the right games in the right order" do
        expect(@season.games.to_a).to eq [newer_games, older_games]
      end
        
      it "should destroy associated games" do
        games = @season.games.to_a
        @season.destroy
        expect(games).not_to be_empty
        games.each do |game|
          expect(Game.where(id: game.id)).to be_empty
        end
      end
    end
    
end
