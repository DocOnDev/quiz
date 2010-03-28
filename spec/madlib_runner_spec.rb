require "spec"
require "lib/madlib_runner"

describe "Madlib Runner" do

  before :each do
    @runner = MadlibRunner.new
  end
  it "should exit on load if no phrase is given" do
    @runner.load_args([])
    @runner.phrase.should == ""

    @runner.load_args(["text, but no actual args we can use"])
    @runner.phrase.should == ""
  end

  it "should parse args into a phrase" do
    @runner.load_args(["p=This is a phrase"])
    @runner.phrase.should == "This is a phrase"

    @runner.load_args(["phrase=This is also a phrase."])
    @runner.phrase.should == "This is also a phrase."
  end

  it "should not play when there is no phrase" do
    @runner.play
    @runner.response.should == "Please provide a phrase for the madlib engine"
  end

  it "should not play when there is an invalid phrase" do
    @runner.phrase = "This is a phrase"
    @runner.play
    @runner.response.should == "Please provide a phrase for the madlib engine"  
  end

end