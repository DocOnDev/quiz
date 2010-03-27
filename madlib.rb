@phrase = 'Your [noun1:noun] sure likes to [verb] the [noun] all over the [location]. [adjective1:adjective] [noun1:noun]. [adjective1:adjective], [adjective1:adjective] [noun1:noun].'

ARGV.each do |arg|
  command, option = arg.split('=')
  @phrase = command if command.include? '['
  @phrase = option if command.upcase == 'P' || command.upcase == 'PHRASE'
end
ARGV.clear

require 'lib/prompt'
require 'madlib_support'

run_with_response @phrase