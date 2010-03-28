require 'lib/string_extensions'

class ArgumentParser
  def parse_and_clear(args)
    phrase = nil
    args.each do |arg|
      command, option = arg.split('=')
      phrase = command if command.madlib_prompt?
      phrase = option if command.madlib_phrase_indicator?
    end
    args.clear
    return phrase
  end
end