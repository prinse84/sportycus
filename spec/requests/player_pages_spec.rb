require 'spec_helper'

describe "PlayerPages" do
  subject { page }
  FactoryGirl.create(:position)
    
  describe "player profile page" do
    let!(:player) { FactoryGirl.create(:player) }
    before { visit player_path(player) }

    it { should have_content(player.name) }
    it { should have_title(player.name) }
  end
  
  describe "add player" do
   
    before { visit new_player_path }
    let(:submit) { "Save player" }
        
    describe "page" do
      it { should have_content('Add a player') }
      it { should have_title(full_title('Add a player')) }
    end
    
    describe "with invalid information - blank form" do
      it "should not create a player" do
          expect { click_button submit }.not_to change(Player, :count)
      end    
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",  with: "Bunters"
        fill_in "Nickname",  with: "2013-12-27"
        select "Outfield", :from => "Position", match: :first
      end
      it "should create a player" do
        expect { click_button submit }.to change(Player, :count).by(1)
      end
    end
  end
  
  describe "edit player" do
    let(:player) {FactoryGirl.create(:player)}
    before { visit edit_player_path(player) }

    describe "page" do
     it { should have_content("Update player details") }
     it { should have_title("Update player details") }
    end
    
    describe "with invalid information" do
      before do
        fill_in "Name",  with: ""
        fill_in "Nickname",  with: "Raps"
        select "Outfield", :from => "Position", match: :first
        click_button "Save player"        
      end
      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_name)  { "Frankie" }
      before do
        fill_in "Name",  with: new_name
        fill_in "Nickname",  with: "Nasty"
        select "Outfield", :from => "Position", match: :first
        click_button "Save player"  
      end
       
      it { should have_content(new_name) }
      it { should have_selector('div.alert.alert-success') }
      specify { expect(player.reload.name).to eq new_name }
    end
    
  end

  describe "index" do
    before { visit players_path }
    it { should have_title('All players') }
    it { should have_content('All players') }
    
  end
  
  describe "pagination" do
    before(:all) { 31.times { FactoryGirl.create(:player) } }
    after(:all)  { Player.delete_all }
    
    it { should have_selector('div.pagination') }
    it "should list each player" do
      Player.paginate(page: 1).each do |player|
        expect(page).to have_selector('td', text: player.name)
      end
    end
  end
end
