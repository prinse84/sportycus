require 'spec_helper'

describe Stat do
  FactoryGirl.create(:stat)
  before { @stat = Stat.first }
  subject { @stat }
  it { should respond_to(:name) }
  it { should respond_to(:abbreviation) }
  
  describe "when name is not present" do
     before { @stat.name = nil }
     it { should_not be_valid }
    end

   describe "when abbreviation is not present" do
     before { @stat.abbreviation = nil }     
     it { should_not be_valid }
   end

   describe "when name is blank" do
     before { @stat.name = " " }
     it { should_not be_valid }
    end

   describe "when abbreviation is blank" do
     before { @stat.abbreviation = " " }     
     it { should_not be_valid }
   end

end
