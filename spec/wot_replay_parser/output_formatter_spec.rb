require 'spec_helper'

module WotReplayParser
  describe OutputFormatter do
    let(:replay_path) { File.join(__dir__,
                                  '..',
                                  'fixtures',
                                  '20140622_0021_germany-RhB_Waffentrager_10_hills.wotreplay') }
    let(:replays) { [WotReplay.new(replay_path)] }
    let(:instance) { OutputFormatter.new(replays) }
    subject { instance }

    its(:replays) { is_expected.to eq replays }
    its(:replays) { is_expected.to_not be_empty }
    its(:replays) { is_expected.to all(be_an_instance_of(WotReplay)) }


    describe '#to_csv' do
      subject { instance.to_csv }
      it { is_expected.to be_an_instance_of Array }
      it 'should have a header row' do
        expect(subject.first).to eq %w(timestamp tank map country)
      end

      its(:second) do
        is_expected.to eq [
                              '2014-06-22T00:21:00+00:00',
                              'Rhm-Borsig Waffenträger',
                              'Hills',
                              'Germany'
                          ]
      end
    end

    describe '.file_extensions' do
      specify do
        expect(OutputFormatter.file_extensions).to be_an_instance_of Hash
      end
    end

    describe '.possible_output_formats' do
      specify do
        expect(OutputFormatter.possible_output_formats).to eq %i(csv json xml yaml)
      end
    end

    describe '.csv_header' do
      specify do
        expect(OutputFormatter.csv_header).to eq %w(timestamp tank map country)
      end
    end
  end
end