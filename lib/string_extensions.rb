class String
  def madlib_prompt?
    self.include? ']'
  end

  def madlib_phrase_indicator?
    self.upcase == 'P' || self.upcase == 'PHRASE'
  end

  def without_madlib_delimiters
    self[1..-2] if self.include? '['    
  end

  def madlib_name_and_prompt
    name = part = nil
    part = self[1..-2] if self.include? '['
    name, part = part.split(':') if part.include? ':'
    return name, part
  end

  def split_madlib_phrase
    modified = self.gsub(/\[/, '|[').gsub(/\]/, ']|')
    modified.split('|')
  end
end
