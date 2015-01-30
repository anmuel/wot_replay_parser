require "bundler/gem_tasks"
require 'optparse'
require 'wot_replay_parser'
require 'pry'

task default: %w[run]

desc 'Starts Replay analysis'
task :run, [:replay_path, :output_file] do |taks, args|
  options = args
  replay_path = options[:replay_path] || File.join(__dir__, 'spec', 'fixtures')
  output_file = options[:output_file] || 'out.csv'

  WotReplayParser.run(replay_path, output_file)
  puts "Analyzed replays found in #{replay_path}."
  puts "Results can be found in #{output_file}"
  exit 0
end
