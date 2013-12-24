require 'spec_helper'

describe "Season pages" do
  subject { page }
  
  describe "season profile page" do
    let(:season) { FactoryGirl.create(:season) }
    before { visit season_path(season) }

    it { should have_content(season.title) }
    it { should have_title(season.title) }
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
end