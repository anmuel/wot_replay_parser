require 'csv'

module WotReplayParser
  class OutputFormatter
    attr_accessor :replays, :output_file

    def initialize(wot_replays, output_file = 'out')
      self.replays = wot_replays
      self.output_file = output_file
    end

    def to_csv
      [self.class.csv_header] + replays.map do |replay|
        [
            replay.time.to_formatted_s,
            replay.tank,
            replay.map,
            replay.country
        ]
      end
    end

    def dump_to_csv(output_file)
      output_file ||= ("#{self.output_file}.#{file_extensions[:csv]}")
      CSV.dump(to_csv, output_file)
    end

    def self.possible_output_formats
      file_extensions.keys
    end

    def self.file_extensions
      {
          csv: 'csv',
          json: 'json',
          xml: 'xml',
          yaml: 'yml'
      }
    end

    def self.csv_header
      %w(timestamp tank map country)
    end
  end
end