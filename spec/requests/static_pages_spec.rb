require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get static_pages_home_path
      response.status.should be(200)
    end
    
    it "should have the content 'Sportycus'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sportycus')
    end
    
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Sportycus | Home")
    end
    
  end
end