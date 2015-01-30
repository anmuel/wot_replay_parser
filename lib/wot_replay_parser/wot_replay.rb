module WotReplayParser
  class WotReplay
    FILE_NAME_PATTERN = /(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})_(?<hour>\d{2})(?<minute>\d{2})_(?<country>\w+)\-(?<tank>.*)_(?<count>\d+)_(?<map>\w+)/
    attr_reader :file, :plain_meta_data

    def self.parse_meta_data_from_file_name(file)
      basename = File.basename(file)
      basename.match(FILE_NAME_PATTERN)
    end

    def initialize(file)
      @file = file

      @plain_meta_data = self.class.parse_meta_data_from_file_name(file)
    end

    def valid?
      plain_meta_data.present?
    end

    def tank
      translate_plain_data(:tank)
    end

    def map
      translate_plain_data(:map)
    end

    def country
      plain_meta_data[:country].humanize
    end

    def time
      DateTime.new(plain_meta_data[:year].to_i,
                   plain_meta_data[:month].to_i,
                   plain_meta_data[:day].to_i,
                   plain_meta_data[:hour].to_i,
                   plain_meta_data[:minute].to_i)
    end

    private
    def translate_plain_data(value_name)
      plain_name = plain_meta_data[value_name]
      I18n.t("#{value_name.to_s.pluralize}.#{plain_name.downcase}",
             default: plain_name)
    end
  end
end
