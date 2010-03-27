require 'lib/prompt'

class Prompts
  attr_reader :collection
  def initialize
    @collection = Hash.new
  end
  
  def add(name, text, offset)
    if @collection.has_key? name
      @collection[name].add_offset(offset)
    else
      @collection[name] = Prompt.new(text, [offset])
    end
  end

  def each
    @collection.each { |entry| yield entry }
  end

  def each_prompt
    @collection.each { |name, prompt| yield prompt.text, prompt.offset }
  end
end