require "spec"
require "lib/string_extensions"

describe "StringExtensions" do

  it "should recognize a madlib prompt" do
    "this is a madlib [prompt] string".should be_a_madlib_prompt
    "this is NOT a madlib prompt string".should_not be_a_madlib_prompt
    true.should == "this is NOT a madlib prompt string".not_madlib_prompt?
  end

  it "should recognize a madlib phrase indicator" do
    "p".should be_a_madlib_phrase_indicator
    "phrase".should be_a_madlib_phrase_indicator
    "other".should_not be_a_madlib_phrase_indicator
  end

  it "should parse a name and prompt from a [name:prompt] string" do
    name, prompt = "[theName:thePrompt]".madlib_name_and_prompt
    name.should == "theName"
    prompt.should == "thePrompt"
  end

  it "should parse only the prompt from a [prompt] string" do
    name, prompt = "[thePrompt]".madlib_name_and_prompt
    prompt.should == "thePrompt"
    name.should == nil
  end

  it "should split a madlib phrase appropriately" do
    string_parts = "First Verb [verb] is better than last place [place].".split_madlib_phrase
    string_parts[0].should == "First Verb " 
    string_parts[1].should == "[verb]"
    string_parts[2].should == " is better than last place "
    string_parts[3].should == "[place]"
    string_parts[4].should == "."
  end
end