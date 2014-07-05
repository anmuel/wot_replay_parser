#!/usr/bin/env ruby

require 'optparse'
require 'lib/wot_replay_parser'

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: ruby wot_replay_parser.rb [options]'
  opts.on('-d', '--dir', 'path to World of Tanks replays directory') do |dir|
    replay_path = dir
  end

  opts.on('-o', '--out', 'output file name') do |out|
    output_file = out
  end

  opts.on('-h', '--help', 'prints out this message and exits') do
    puts opts
    exit
  end
end

optparse.parse!
replay_path ||= File.join(__dir__, '..', 'spec', 'fixtures')
output_file ||= 'out.csv'

WotReplayParser.run(replay_path, output_file)