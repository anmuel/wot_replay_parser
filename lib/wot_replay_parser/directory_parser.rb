module WotReplayParser
  class DirectoryParser
    DEFAULT_FILE_EXTENSION = 'wotreplay'

    attr_reader :replays

    def initialize(replays_path, file_extension = DEFAULT_FILE_EXTENSION)
      @replays = self.class.parse(replays_path, file_extension)
    end

    def self.parse(replays_path, file_extension = DEFAULT_FILE_EXTENSION)
      Dir.glob(File.join(replays_path, "**.#{file_extension}")).map do |file|
        WotReplay.new(file)
      end.select(&:valid?)
    end
  end
end
