require "spec"
require "lib/argument_parser"

describe "ArgumentParser" do
  before :each do
    @parser = ArgumentParser.new
  end
  it "should parse command line arguments" do
    phrase = @parser.parse_and_clear ["p=This is it"]
    phrase.should == "This is it"
  end

  it "should clear the args list" do
    args = ["phrase=This is the phrase"]
    @parser.parse_and_clear args
    args.size.should == 0
  end
end