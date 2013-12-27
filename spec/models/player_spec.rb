require 'spec_helper'

describe Player do
  
  let(:position) { FactoryGirl.create(:position) }
  before { @player = Player.new(name: "Nate Jones", moniker: "Nasty", position_id: position.id) }
  subject { @player }
  it { should respond_to(:name) }
  it { should respond_to(:moniker) }
  its(:position) { should eq position }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @player.name = nil }
    it { should_not be_valid }
  end  
  
  describe "when position_id is not present" do
    before { @player.position_id = nil }
    it { should_not be_valid }
  end
    
end
