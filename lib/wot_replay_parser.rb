require 'active_support/all'
require 'wot_replay_parser/version'
require 'wot_replay_parser/wot_replay'
require 'csv'
require File.expand_path(File.join('config', 'config'))

module WotReplayParser
  def parse(replays_path, output_file)
    replays = Dir.glob(replays_path, '**.wotreplay').each_with_object([]) do |file, _replays|
      _replays << WotReplay.new(file)
    end

    write_csv(replays, output_file)
  end

  def write_csv(replays, output_file)
    rows = replays.each_with_object([]) do |replay, _rows|
      _rows << [
          replay.time.to_formatted_s,
          replay.tank,
          replay.map,
          replay.country
      ]
    end
    headers = %w(timestamp tank map country)
    CSV.dump(headers + rows, output_file)
  end
end
