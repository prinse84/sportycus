require 'spec_helper'

describe Gameresult do
  FactoryGirl.create(:gameresult)
  before { @gameresult = Gameresult.first }
  subject { @gameresult }
  it { should respond_to(:name) }
  it { should respond_to(:abbreviation) }
  
  describe "when name is not present" do
    before { @gameresult.name = nil }
    it { should_not be_valid }
   end
   
  describe "when abbreviation is not present" do
    before { @gameresult.abbreviation = nil }     
    it { should_not be_valid }
  end
  
  describe "when name is blank" do
    before { @gameresult.name = " " }
    it { should_not be_valid }
   end
   
  describe "when abbreviation is blank" do
    before { @gameresult.abbreviation = " " }     
    it { should_not be_valid }
  end 
  
  describe "games associations" do
    it "should destroy associated games" do
      FactoryGirl.create(:game, gameresult: @gameresult)
      games = @gameresult.games.to_a
      @gameresult.destroy
      expect(games).not_to be_empty
      games.each do |game|
        expect(Game.where(id: game.id)).to be_empty
      end
    end
  end
   
end
