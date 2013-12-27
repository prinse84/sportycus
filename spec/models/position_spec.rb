require 'spec_helper'

describe Position do
  FactoryGirl.create(:position)
  
  before { @position = Position.first }
  subject { @position }
  it { should respond_to(:name) }
  it { should respond_to(:abbreviation) }
  
  describe "when name is not present" do
    before { @position.name = nil }
    it { should_not be_valid }
   end
   
  describe "when abbreviation is not present" do
    before { @position.abbreviation = nil }     
    it { should_not be_valid }
  end
  
  describe "when name is blank" do
    before { @position.name = " " }
    it { should_not be_valid }
   end
   
  describe "when abbreviation is blank" do
    before { @position.abbreviation = " " }     
    it { should_not be_valid }
  end

  pending "example to test nullify"
end
