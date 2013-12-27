require 'spec_helper'

describe "GamePages" do
  subject { page }
  
  FactoryGirl.create(:gamesite)
  FactoryGirl.create(:gameresult)
  let(:season) { FactoryGirl.create(:season) }  

  describe "add game page" do
    before { visit new_season_game_path(season) }
    let(:submit) { "Add Game" }
        
    describe "page" do
      it { should have_content('Add a game') }
      it { should have_title(full_title('Add a game for ' + season.title)) }
    end

    describe "with invalid information - blank form" do
      it "should not create a game" do
          expect { click_button submit }.not_to change(Game, :count)
      end    
    end
    
    describe "with invalid information - blank form" do 
      before { click_button submit }
      it { should have_content('error') }
    end
    
    describe "with valid information" do
      before do
        fill_in "Opponent",  with: "Bunters"
        fill_in "Game Date",  with: "2013-12-27"
        fill_in "Game Time",  with: "09:00:00"
        select "Home", :from => "Game Site", match: :first
        select "Win", :from => "Game Result", match: :first  
      end
      it "should create a game" do
        expect { click_button submit }.to change(Game, :count).by(1)
      end
    end
  end

  describe "game page" do
    let!(:game) { FactoryGirl.create(:game, season: season) }
    
    before { visit season_game_path(season, game) }
    it { should have_content(game.opponent) }
    it { should have_title('Game details') }
    it { should have_content(game.gameresult.abbreviation) }
    it { should have_content(game.game_date) } 
    it { should have_content(game.game_time) }       
    
  end
  
  describe "edit game" do 
    let(:season) { FactoryGirl.create(:season) }
    let(:game) {FactoryGirl.create(:game, season: season)}
    before { visit edit_season_game_path(season, game) }

     describe "page" do
       it { should have_content("Update game details") }
       it { should have_title("Update game") }
     end
     
    describe "with invalid information" do
      before do
        fill_in "Opponent",  with: ""
        fill_in "Game Date",  with: "2013-12-27"
        fill_in "Game Time",  with: "09:00:00"
        select "Home", :from => "Game Site", match: :first
        select "Win", :from => "Game Result", match: :first  
        click_button "Save game"        
      end
       
      it { should have_content('error') }
    end
     
    describe "with valid information" do
      let(:new_opponent)  { "Cheetahs" }
      before do
        fill_in "Opponent",  with: new_opponent
        fill_in "Game Date",  with: "2013-12-27"
        fill_in "Game Time",  with: "09:00:00"
        select "Home", :from => "Game Site", match: :first
        select "Win", :from => "Game Result", match: :first
        click_button "Save game"  
      end
       
      it { should have_content(new_opponent) }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(game.reload.opponent).to eq new_opponent }
    end
  end
  
end
