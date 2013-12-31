require 'spec_helper'

describe "BoxPages" do
  subject { page }
  let(:season) { FactoryGirl.create(:season) }  
  let(:game) { FactoryGirl.create(:game) }      
  
  describe "add game page" do
     before { visit new_season_game_box_path(season, game) }
     let(:submit) { "Save Box" }
     
     describe "page" do
       it { should have_content('Add Box') }
       it { should have_title(full_title('Add Box')) }
     end
     
     describe "with invalid information - blank form" do
       it "should not create a box" do
           expect { click_button submit }.not_to change(Box, :count)
       end    
     end
  
  end
end
