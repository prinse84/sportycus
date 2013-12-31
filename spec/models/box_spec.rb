require 'spec_helper'

describe Box do
  
  let(:game) { FactoryGirl.create(:game) }
  let(:player) { FactoryGirl.create(:player) }  
  let(:stat) { FactoryGirl.create(:stat) }    
  
  before { @box = FactoryGirl.create(:box, game: game, player: player, stat: stat) }
  
  subject { @box }
  it { should respond_to(:player_id) }
  it { should respond_to(:game_id) }
  it { should respond_to(:stat_id) }  
  it { should respond_to(:value) }    
  
  describe "when player id is not present" do
     before { @box.player_id = nil }
     it { should_not be_valid }
    end

   describe "when stat_id is not present" do
     before { @box.stat_id = nil }     
     it { should_not be_valid }
   end
   
   describe "when game_id is not present" do
     before { @box.game_id = nil }     
     it { should_not be_valid }
   end
   
   describe "when value is not present" do
     before { @box.value = nil }     
     it { should_not be_valid }
   end
   
   describe "when player id is blank" do
     before { @box.player_id = " " }
     it { should_not be_valid }
    end

   describe "when stat id is blank" do
     before { @box.stat_id = " " }     
     it { should_not be_valid }
   end
   
   describe "when game id is blank" do
     before { @box.game_id = " " }     
     it { should_not be_valid }
   end
   
   describe "when value is blank" do
     before { @box.game_id = " " }     
     it { should_not be_valid }
   end

   describe "box associations" do
     let(:g1) { FactoryGirl.create(:game, game_date: 2.days.ago)  } 
     let(:p1) { FactoryGirl.create(:player)  }   
     let(:s1) { FactoryGirl.create(:stat)  }               
     
     it "should destroy associated game records on the Box object" do
      FactoryGirl.create(:box, game: g1)
      FactoryGirl.create(:box, game: g1)
      boxes = g1.boxes.to_a
      g1.destroy
      expect(boxes).not_to be_empty
      boxes.each do |box|
         expect(Box.where(id: box.id)).to be_empty
      end
    end
    
    it "should destroy associated player records on the Box object" do
      FactoryGirl.create(:box, player: p1)
      FactoryGirl.create(:box, player: p1)
      boxes = p1.boxes.to_a
      p1.destroy
      expect(boxes).not_to be_empty
      boxes.each do |box|
         expect(Box.where(id: box.id)).to be_empty
      end
    end
    
    it "should destroy associated stat records on the Box object" do
      FactoryGirl.create(:box, stat: s1)
      FactoryGirl.create(:box, stat: s1)
      boxes = s1.boxes.to_a
      s1.destroy
      expect(boxes).not_to be_empty
      boxes.each do |box|
         expect(Box.where(id: box.id)).to be_empty
      end
    end
        
   end
            
end
