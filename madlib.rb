require 'lib/string_extensions'
require 'lib/argument_parser'
require 'lib/prompts'
require 'madlib_support'

phrase = parse_command_line ARGV
phrase ||= 'Your [noun1:noun] sure likes to [verb] the [noun] all over the [location]. [adjective1:adjective] [noun1:noun]. [adjective1:adjective], [adjective1:adjective] [noun1:noun].'
run_with_phrase phrase