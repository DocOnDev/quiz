class Prompt
  attr_accessor :text, :offset
  def initialize(text, offset)
    @text = text
    @offset = offset
  end

  def add_offset(offset)
    @offset << offset
  end
end
