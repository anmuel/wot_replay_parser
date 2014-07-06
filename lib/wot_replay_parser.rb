require 'active_support/all'
require 'wot_replay_parser/version'
require 'wot_replay_parser/directory_parser'
require 'wot_replay_parser/output_formatter'
require 'wot_replay_parser/wot_replay'
require File.expand_path('config', 'config')

module WotReplayParser
  def self.run(replays_path, output_file)
    input_parser = DirectoryParser.new(replays_path)
    output_formatter = OutputFormatter.new(input_parser.replays)
    output_formatter.dump_to_csv(output_file)
  end
end
