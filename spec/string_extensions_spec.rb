require "spec"
require "lib/string_extensions"

describe "StringExtensions" do

  it "should recognize a madlib prompt" do
    "this is a madlib [prompt] string".should be_a_madlib_prompt
    "this is NOT a madlib prompt string".should_not be_a_madlib_prompt
  end

  it "should recognize a madlib phrase indicator" do
    "p".should be_a_madlib_phrase_indicator
    "phrase".should be_a_madlib_phrase_indicator
    "other".should_not be_a_madlib_phrase_indicator
  end
  
end