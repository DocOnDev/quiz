require "spec"
require "lib/prompt"

describe "Prompt" do

  before(:each) do
    @prompt = Prompt.new("text", [1])
  end
  it "should have text" do
    "text".should == @prompt.text
  end

  it "should have an offset" do
    1.should == @prompt.offset[0]
  end

  it "should accommodate multiple offsets" do
    @prompt.add_offset(2)
    2.should == @prompt.offset[1]
  end
  
end