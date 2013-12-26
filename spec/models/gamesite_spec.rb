require 'spec_helper'

describe Gamesite do
  FactoryGirl.create(:gamesite)
  before { @gamesite = Gamesite.first }
  subject { @gamesite }
  it { should respond_to(:name) }
  it { should respond_to(:abbreviation) }

  describe "when name is not present" do
    before { @gamesite.name = nil }
    it { should_not be_valid }
   end
   
  describe "when abbreviation is not present" do
    before { @gamesite.abbreviation = nil }     
    it { should_not be_valid }
  end
  
  describe "when name is blank" do
    before { @gamesite.name = " " }
    it { should_not be_valid }
   end
   
  describe "when abbreviation is blank" do
    before { @gamesite.abbreviation = " " }     
    it { should_not be_valid }
  end
  
  describe "games associations" do
    it "should destroy associated games" do
      FactoryGirl.create(:game, gamesite: @gamesite)  
      games = @gamesite.games.to_a
      @gamesite.destroy
      expect(games).not_to be_empty
      games.each do |game|
        expect(Game.where(id: game.id)).to be_empty
      end
    end
  end
  
end
