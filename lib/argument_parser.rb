def parse_command_line args
  phrase = nil
  args.each do |arg|
    command, option = arg.split('=')
    phrase = command if command.madlib_prompt?
    phrase = option if command.madlib_phrase_indicator?
  end
  args.clear
  return phrase
end
