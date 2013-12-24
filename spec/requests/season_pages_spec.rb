require 'spec_helper'

describe "Season pages" do
  subject { page }
  
  describe "season profile page" do
    let(:season) { FactoryGirl.create(:season) }
    before { visit season_path(season) }

    it { should have_content(season.title) }
    it { should have_title(season.title) }
  end
end