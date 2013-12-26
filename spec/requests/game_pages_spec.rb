require 'spec_helper'

describe "GamePages" do
  subject { page }
  
  describe "add game page" do
    let(:season) { FactoryGirl.create(:season) }
    before { visit new_season_game_path(season) }
    let(:submit) { "Add Game" }
        
    describe "add game page for a specific season" do
      it { should have_content('Add a game') }
      it { should have_title(full_title('Add a game for ' + season.title)) }
    end

    describe "with invalid information" do
      it "should not create a game" do
        expect { click_button submit }.not_to change(Game, :count)
      end
    end
    

  end
end
