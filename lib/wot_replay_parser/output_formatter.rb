require 'csv'

module WotReplayParser
  class OutputFormatter
    attr_accessor :replays, :output_file

    def initialize(wot_replays, output_file = 'out')
      self.replays = wot_replays
      self.output_file = output_file
    end

    def to_csv
      headers = [self.class.csv_header]
      rows = replays.map do |replay|
        [
            replay.time.to_formatted_s,
            replay.tank,
            replay.map,
            replay.country
        ]
      end

      headers + rows
    end

    def dump_to_csv(output_file = '')
      output_file ||= ("#{self.output_file}.#{file_extensions[:csv]}")
      CSV.open(output_file, 'w+') do |csv|
        to_csv.each do |line|
          csv << line
        end
      end
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