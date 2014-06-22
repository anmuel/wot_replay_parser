require 'optparse'
require 'active_support/all'
require 'wot_replay_parser/version'
require 'wot_replay_parser/wot_replay'
require File.expand_path(File.join('config', 'config'))

module WotReplayParser
  replay_path ||= File.join(__dir__, '..', 'spec', 'fixtures')

  # replays = Dir.glob(replay_path, '**.wotreplay').each_with_object([]) do |file, _replays|
  #   _replays << WotReplay.new(file)
  # end
end
