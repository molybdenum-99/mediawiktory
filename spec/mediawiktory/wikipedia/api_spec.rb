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

      context 'chain with changed meaning of methods' do
        let(:action) { api.query.titles('Argentina').prop(:info, :wbentityusage, :revisions).prop(:timestamp, :url) }

        its(:to_param) { is_expected.to eq(
          'action' => 'query',
          'titles' => 'Argentina',
          'prop' => 'info|wbentityusage|revisions',
          'rvprop' => 'timestamp',
          'inprop' => 'url'
        ) }
      end

      context 'chain with globals' do
        let(:action) { api.query.format(:json).callback('mycallback') }

        its(:to_param) { is_expected.to eq('action' => 'query', 'format' => 'json', 'callback' => 'mycallback') }
      end

      context 'generators' do
        let(:action) { api.query.generator(:categorymembers).title('Category:Countries_in_South_America').limit(30).prop(:revisions).prop(:content).limit('max') }
        its(:to_param) { is_expected.to eq(
          'action' => 'query',
          'generator' => 'categorymembers',
          'gcmtitle' => 'Category:Countries_in_South_America',
          'gcmlimit' => '30',
          'prop' => 'revisions',
          'rvprop' => 'content',
          'rvlimit' => 'max'
        ) }
      end

      context 'fail on unknown enum values' do
        let(:action) { api.query.generator(:ctegorymembers) }

        its_call { is_expected.to raise_error ArgumentError, 'Unknown value for generator: ctegorymembers' }
      end

      context 'fail on unknown list values' do
        let(:action) { api.query.titles('Argentina').prop(:nfo) }

        its_call { is_expected.to raise_error ArgumentError, 'Unknown value for prop: nfo' }
      end
    end

    describe 'client' do
      context 'when user agent passed' do
        subject { described_class.new(user_agent: 'FooBar') }
        its(:'client.user_agent') { is_expected.to eq 'FooBar' }
        its(:defaults) { are_expected.to be_empty }
      end
    end
  end
end
