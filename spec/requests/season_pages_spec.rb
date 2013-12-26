require 'spec_helper'

describe "Season pages" do
  subject { page }
  
  describe "index" do
    before { visit seasons_path }
    it { should have_title('All seasons') }
    it { should have_content('All seasons') }
    it { should have_link('Add season', href: new_season_path) }

    it "should list each season" do
      Season.all.each do |season|
        expect(page).to have_selector('li', text: season.title)
      end
    end
    
    
    describe "pagination" do
      before(:all) { 31.times { FactoryGirl.create(:season) } }
      after(:all)  { Season.delete_all }
      
      it { should have_selector('div.pagination') }
      it "should list each user" do
        Season.paginate(page: 1).each do |season|
          expect(page).to have_selector('li', text: season.title)
        end
      end
    end
    
    describe "delete links" do      
      before(:all) { 3.times { FactoryGirl.create(:season) } }
      after(:all)  { Season.delete_all }
      it { should have_link('delete', href: season_path(Season.first)) }
      it "should be able to delete a season" do
        expect do
          click_link('delete', match: :first)
        end.to change(Season, :count).by(-1)
      end
    end
        
  end
  
  describe "season profile page" do
    let(:season) { FactoryGirl.create(:season) }
    let!(:g1) { FactoryGirl.create(:game, season: season, opponent: "Bunt Pirates", game_date: 1.day.ago) }
    let!(:g2) { FactoryGirl.create(:game, season: season, opponent: "Blue Waffles") }
    
    before { visit season_path(season) }

    it { should have_content(season.title) }
    it { should have_title(season.title) }
    it { should have_link('Update season details',  href: edit_season_path(season)) }
    it { should have_link('Add a game',  href: new_season_game_path(season)) }
    
    describe "games" do
      it { should have_content(g1.opponent) }
      it { should have_content(g2.opponent) }
      it { should have_content(season.games.count) }
    end
    
    describe "when team is playing at home" do
      let(:gamesite) {Gamesite.find_by_name("Home")}
      let!(:g3) { FactoryGirl.create(:game, season: season, gamesite: gamesite) }
      before { visit season_path(season) }
      it { should have_content "vs" }
    end
    
    describe "when team is playing away" do
      let(:gamesite) { FactoryGirl.create(:gamesite, name: 'Away') }  
      let!(:g3) { FactoryGirl.create(:game, season: season, gamesite: gamesite) }
      before { visit season_path(season) }
      it { should have_content "@" }
    end
    
    describe "when team is playing at a neutal location" do
      let(:gamesite) { FactoryGirl.create(:gamesite, name: 'Neutral') }  
      let!(:g3) { FactoryGirl.create(:game, season: season, gamesite: gamesite) }
      before { visit season_path(season) }
      it { should have_content "vs" }
    end
  end
  
  describe "add season page" do
    before { visit new_season_path }
    let(:submit) { "Add Season" }
      
      describe "with invalid information" do
        it "should not create a season" do
          expect { click_button submit }.not_to change(Season, :count)
        end
      end
      
      describe "with valid information" do
        before do
          fill_in "Title",  with: "Fall 2005"
          fill_in "Description",  with: "Fall 2005 Season"
        end
        it "should create a season" do
          expect { click_button submit }.to change(Season, :count).by(1)
        end
      end
  end
  
  describe "edit season" do
     let(:season) { FactoryGirl.create(:season) }
     before { visit edit_season_path(season) }

     describe "page" do
       it { should have_content("Update season details") }
       it { should have_title("Update season") }
     end
     
     describe "with invalid information" do
       let(:new_title)  { "" }
       let(:new_description) { "The summer 2006 season" }
       before do
         fill_in "Title", with: new_title
         fill_in "Description", with: new_description
         click_button "Save changes"
       end
       
       it { should have_content('error') }
     end
     
     describe "with valid information" do
       let(:new_title)  { "Summer 2006" }
       let(:new_description) { "The summer 2006 season" }
       before do
         fill_in "Title", with: new_title
         fill_in "Description", with: new_description
         click_button "Save changes"
       end
       
       it { should have_title(new_title) }
       it { should have_selector('div.alert.alert-success') }
       specify { expect(season.reload.title).to  eq new_title }
       specify { expect(season.reload.description).to eq new_description }
     end
  end
   
end