class String
  def is_madlib_prompt?
    self.include? ']'
  end

  def without_delimiters
    self[1..-2] if self.include? '['
  end

end

def run_with_response(response)
  response_parts = split_response(response)
  #TODO: Consider changing this to a class
  @prompts = Hash.new

  response_parts.each_with_index do |part, index|
    if part.is_madlib_prompt?
      part = part.without_delimiters
      name = "mad_lib_id_" + index.to_s
      name, part = part.split(':') if part.include? ':'
      if @prompts.has_key? name
        @prompts[name].add_offset(index)
      else
        @prompts[name] = Prompt.new(part, [index])
      end
    end
  end

  @prompts.each do |name, prompt|
    puts 'Give me a ' + prompt.text
    answer = gets.chomp
    prompt.offset.each do |offset|
      response_parts[offset] = answer
    end
  end

  puts response_parts.join()
end

def split_response(response)
  # TODO: find a better way to adjust the string prior to split
  response = response.gsub(/\[/, '|[')
  response = response.gsub(/\]/, ']|')
  response.split('|')
end
