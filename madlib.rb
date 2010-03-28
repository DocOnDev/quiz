require 'lib/madlib_runner'

runner = MadlibRunner.new
runner.load_args(ARGV) if ARGV.size > 0
runner.play
puts runner.response