require 'lib/string_extensions'
require 'lib/prompts'

REQUEST_PREFIX = 'Give me a '
NAME_PREFIX = "mad_lib_name_"

class MadlibRunner
  attr_accessor :phrase
  def play
    if @phrase.nil? || !@phrase.madlib_prompt?
      puts "Please provide a phrase for the madlib engine"
      return
    end
    prompts = Prompts.new
    phrase_parts = @phrase.split_madlib_phrase

    phrase_parts.each_with_index do |string_part, index|
      if string_part.madlib_prompt?
        name, prompt = string_part.madlib_name_and_prompt
        name ||= NAME_PREFIX + index.to_s
        prompts.add(name, prompt, index)
      end
    end

    prompts.each_prompt do |text, offsets|
      answer = answer_question(REQUEST_PREFIX + text)
      offsets.each do |offset|
        phrase_parts[offset] = answer
      end
    end

    puts phrase_parts.join()
  end

private
  def answer_question(question)
    puts question
    gets.chomp
  end
end
