require "spec"
require "lib/prompts"

describe "Prompts" do

  before :each do
    @prompts = Prompts.new
    @prompts.add("theName", "thePrompt", 2)
  end

  it "should retrieve a Name and Prompt" do
    @prompts.each do |name, prompt|
      name.should == "theName"
      prompt.text.should == "thePrompt"
    end
  end

  it "should support multiple indexes for a Name" do
    @prompts.add("theName", "thePrompt", 3)
    @prompts.add("theName", "thePrompt", 4)
    @prompts.each do |name, prompt|
      name.should == "theName"
      prompt.text.should == "thePrompt"
      prompt.offset.size.should == 3
    end
  end
end