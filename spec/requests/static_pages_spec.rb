require 'spec_helper'

describe "Static pages" do
  subject { page }
  before { visit root_path }
    it { should have_content('Sportycus') }
    it { should have_title("Sportycus") }
    it { should_not have_title('Sportycus | Home') }
    it { should_not have_content('Sample App') }
end