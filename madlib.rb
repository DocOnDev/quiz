require 'lib/argument_parser'
require 'lib/prompts'
require 'lib/madlib_support'

parser = ArgumentParser.new
phrase = parser.parse ARGV
phrase ||= 'Your [noun1:noun] sure likes to [verb] the [noun] all over the [location]. [adjective1:adjective] [noun1:noun]. [adjective1:adjective], [adjective1:adjective] [noun1:noun].'
run_with_phrase phrase