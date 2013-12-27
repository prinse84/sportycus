require 'spec_helper'

describe Game do
    
  let(:season) { FactoryGirl.create(:season) }
  let(:gameresult) { FactoryGirl.create(:gameresult) }  
  let(:gamesite) { FactoryGirl.create(:gamesite) }    
  before { @game = season.games.build(opponent: "Bunt Pirates", game_date: 1.day.ago, game_time: 1.day.ago, gameresult_id: gameresult.id, gamesite_id: gamesite.id ) }
  subject { @game }
  it { should respond_to(:opponent) }
  it { should respond_to(:season_id) }
  it { should respond_to(:game_date) }
  it { should respond_to(:game_time) }
  it { should respond_to(:gameresult) }
  it { should respond_to(:season) }
  its(:season) { should eq season }
  its(:gameresult) {should eq gameresult }
  its(:gamesite) {should eq gamesite }  
    
  it { should be_valid }
    
  describe "when season_id is not present" do
    before { @game.season_id = nil }
    it { should_not be_valid }
  end  
    
  describe "when opponent is not present" do
    before { @game.opponent = nil }
    it { should_not be_valid }
  end
    
  describe "when game_date is not present" do
    before { @game.game_date = nil }
    it { should_not be_valid }
  end 
  
  describe "when gameresult is not present" do
    before { @game.gameresult = nil }
    it { should_not be_valid }
  end 
  
  describe "when gamesite is not present" do
    before { @game.gamesite = nil }
    it { should_not be_valid }
  end
    
  describe "with blank opponent" do
    before { @game.opponent = " " }
    it { should_not be_valid }
  end
    
  describe "with blank date" do
    before { @game.game_date = " " }
    it { should_not be_valid }
  end
  
end
