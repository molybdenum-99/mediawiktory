module MediaWiktory
  describe Wikipedia::Api do
    let(:api) { described_class.new }

    describe 'Chain of calls' do
      subject { action.to_param }

      context 'simple' do
        let(:action) { api.query }

        it { is_expected.to eq('action' => 'query') }
      end

      context 'long chain' do
        let(:action) { api.query.titles('Argentina', 'Bolivia').prop(:revisions).prop(:content).limit('max') }

        it { is_expected.to eq(
          'action' => 'query',
          'titles' => 'Argentina|Bolivia',
          'prop' => 'revisions',
          'rvprop' => 'content',
          'rvlimit' => 'max'
        ) }
      end

      context 'chain with globals' do
        let(:action) { api.query.format(:json).callback('mycallback') }

        it { is_expected.to eq('action' => 'query', 'format' => 'json', 'callback' => 'mycallback') }
      end
    end
  end
end
