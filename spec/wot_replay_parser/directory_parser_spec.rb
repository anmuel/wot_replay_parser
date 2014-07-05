require 'spec_helper'

module WotReplayParser
  describe DirectoryParser do
    let(:replays_path) { File.join(__dir__, '..', 'fixtures') }
    describe '.new' do
      subject { DirectoryParser.new(replays_path) }
      its(:replays) { should_not be_empty }
    end

    describe '.parse' do
      subject { DirectoryParser.parse(replays_path) }

      it { is_expected.to be_an_instance_of Array }
      it { is_expected.to_not be_empty }
      it { is_expected.to all(be_an_instance_of(WotReplay)) }
    end
  end
end