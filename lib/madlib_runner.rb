require 'lib/string_extensions'
require 'lib/argument_parser'
require 'lib/prompts'

REQUEST_PREFIX = 'Give me a '
NAME_PREFIX = "mad_lib_name_"

class MadlibRunner
  attr_accessor :phrase
  attr_reader :response
  
  def load_args(args)
    parser = ArgumentParser.new
    @phrase = parser.parse_and_clear args
  end

  def play
    return if not_ready_to_play?
    @response = process_phrase(@phrase)
  end

private
  def not_ready_to_play?
    if @phrase.nil? || @phrase.not_madlib_prompt?
      @response = "Please provide a phrase for the madlib engine"
      return true
    end
    return false
  end
  
  def process_phrase(phrase)
    prompts, parts = parse_phrase(phrase)
    process_prompts(prompts, parts)
  end

  def process_prompts(prompts, phrase_parts)
    prompts.each_prompt do |text, offsets|
      answer = answer_question(REQUEST_PREFIX + text)
      offsets.each do |offset|
        phrase_parts[offset] = answer
      end
    end
    phrase_parts.join()
  end

  def parse_phrase phrase
    phrase_parts = phrase.split_madlib_phrase
    prompts = Prompts.new

    phrase_parts.each_with_index do |string_part, index|
      if string_part.madlib_prompt?
        name, prompt = string_part.madlib_name_and_prompt
        name ||= NAME_PREFIX + index.to_s
        prompts.add(name, prompt, index)
      end
    end
    return prompts, phrase_parts
  end

  def answer_question(question)
    puts question
    gets.chomp
  end
end
