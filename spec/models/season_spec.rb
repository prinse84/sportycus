require 'spec_helper'

describe Season do
  #pending "add some examples to (or delete) #{__FILE__}"
  before { @season = Season.new(title: "Fall 2005", description: "Fall 2005 Season") }

    subject { @season }

    it { should respond_to(:title) }
    it { should respond_to(:description) }
    
    describe "when title is not present" do
      before { @season.title = " " }
      it { should_not be_valid }
    end
end
