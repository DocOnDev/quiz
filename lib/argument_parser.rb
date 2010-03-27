def parse_command_line args
  phrase = nil
  args.each do |arg|
    command, option = arg.split('=')
    phrase = command if command.is_madlib_prompt?
    phrase = option if command.is_a_madlib_phrase_indicator?
  end
  args.clear
  return phrase
end
