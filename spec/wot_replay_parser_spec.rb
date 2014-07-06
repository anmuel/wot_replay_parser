require 'spec_helper'

describe WotReplayParser do
  describe '.run' do
    let(:out) { File.join(__dir__, 'output.csv') }
    let(:path) { File.join(__dir__, '..', 'fixtures') }

    after { File.unlink(out) }

    it 'should parse the given directory and output a csv file' do
      WotReplayParser.run(path, out)
      expect(File.exist?(out)).to be
    end
  end
end