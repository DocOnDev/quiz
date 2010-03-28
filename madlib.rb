require 'lib/argument_parser'
require 'lib/madlib_runner'

parser = ArgumentParser.new
runner = MadlibRunner.new
runner.phrase = parser.parse_and_clear ARGV
runner.phrase ||= 'Your [noun1:noun] sure likes to [verb] the [noun] all over the [location]. [adjective1:adjective] [noun1:noun]. [adjective1:adjective], [adjective1:adjective] [noun1:noun].'
runner.play