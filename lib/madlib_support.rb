REQUEST_PREFIX = 'Give me a '
NAME_PREFIX = "mad_lib_name_"

def run_with_phrase(phrase)
  prompts = Prompts.new
  phrase_parts = phrase.split_madlib_phrase

  phrase_parts.each_with_index do |string_part, index|
    if string_part.madlib_prompt?
      name, prompt = string_part.madlib_name_and_prompt
      name ||= NAME_PREFIX + index.to_s
      prompts.add(name, prompt, index)
    end
  end

  prompts.each_prompt do |text, offsets|
    puts REQUEST_PREFIX + text
    answer = gets.chomp
    offsets.each do |offset|
      phrase_parts[offset] = answer
    end
  end

  puts phrase_parts.join()
end
