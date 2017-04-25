module MediaWiktory
  describe Wikipedia::Api do
    let(:api) { described_class.new }

    describe 'Chain of calls' do
      subject { action }

      context 'simple' do
        let(:action) { api.query }

        its(:to_param) { is_expected.to eq('action' => 'query') }
      end

      context 'long chain' do
        let(:action) { api.query.titles('Argentina', 'Bolivia').prop(:revisions).prop(:content).limit('max') }

        its(:to_param) { is_expected.to eq(
          'action' => 'query',
          'titles' => 'Argentina|Bolivia',
          'prop' => 'revisions',
          'rvprop' => 'content',
          'rvlimit' => 'max'
        ) }

        its(:to_url) { is_expected.to eq 'https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvlimit=max&rvprop=content&titles=Argentina%7CBolivia' }
      end

      context 'chain with globals' do
        let(:action) { api.query.format(:json).callback('mycallback') }

        its(:to_param) { is_expected.to eq('action' => 'query', 'format' => 'json', 'callback' => 'mycallback') }
      end
    end
  end
end
