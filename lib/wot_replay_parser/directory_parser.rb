module WotReplayParser
  class DirectoryParser
    attr_reader :replays

    def initialize(replays_path)
      @replays = self.class.parse(replays_path)
    end

    def self.parse(replays_path)
      Dir.glob(File.join(replays_path, '**.wotreplay')).map do |file|
        WotReplay.new(file)
      end
    end
  end
end