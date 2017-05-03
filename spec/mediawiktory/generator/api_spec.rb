require 'mediawiktory/generator'

RSpec.describe MediaWiktory::Generator::Api do
  describe '.from_html' do
    let(:source) { File.read('spec/fixtures/api.php.html') }

    subject(:api) { described_class.from_html(source) }

    describe '#actions' do
      subject { api.actions }

      it { is_expected.to be_an(Array).and have_attributes(size: 116).and all be_a(MediaWiktory::Generator::Module) }
      its_map(:name) { is_expected.to include('edit', 'query', 'delete') }
    end

    describe '#modules' do
      subject { api.modules }

      it { is_expected.to be_an(Array) }
      its_map(:name) { are_expected.to include('query', 'categories', 'categorymembers', 'json') }
    end
  end

  describe '.from_url' do
    it 'fetches API version/sitename, then full API and parses it' do
      stub_request(:get, 'https://en.wikipedia.org/w/api.php?action=query&meta=siteinfo&siprop=general&format=json')
        .to_return(body: File.read('spec/fixtures/siteinfo.json'))
      stub_request(:get, 'https://en.wikipedia.org/w/api.php?action=help&recursivesubmodules=true')
        .to_return(body: '<html>TEST</html>')
      expect(described_class).to receive(:from_html)
        .with('<html>TEST</html>',
          source: 'https://en.wikipedia.org/w/api.php',
          site: {name: 'Wikipedia', base: 'https://en.wikipedia.org/wiki/Main_Page'}
        )

      described_class.from_url('https://en.wikipedia.org/w/api.php')
    end
  end

  describe '#to_h' do
    let(:source) { File.read('spec/fixtures/api_short.php.html') }

    let(:api) {
      described_class.from_html(
        source,
        source: 'https://en.wikipedia.org/w/api.php',
        site: {name: 'Wikipedia', base: 'https://en.wikipedia.org/wiki/Main_Page'}
      )
    }
    subject { api.to_h }

    it { is_expected.to include(
      'source' => 'https://en.wikipedia.org/w/api.php',
      'site' => {'name' => 'Wikipedia', 'base' => 'https://en.wikipedia.org/wiki/Main_Page'}
    ) }
  end

  describe '#to_html' do
    let(:source) { File.read('spec/fixtures/api_short.php.html') }

    let(:api) {
      described_class.from_html(
        source,
        site: OpenStruct.new(name: 'Wikipedia', base: 'https://en.wikipedia.org/wiki/Main_Page')
      )
    }
    subject { api.to_html(namespace: 'Dummy', source: 'https://en.wikipedia.org/w/api.php') }

    it 'creates base docs' do
      is_expected
        .to include('The base API class for [Wikipedia](https://en.wikipedia.org/wiki/Main_Page).')
        .and include('Generated from https://en.wikipedia.org/w/api.php')
    end

    it 'creates action methods' do
      is_expected
        .to include(%Q{
          |    # @return [Dummy::Actions::Abusefiltercheckmatch]
          |    #
          |    def abusefiltercheckmatch(**options)
          |      Actions::Abusefiltercheckmatch.new(client, @defaults.merge(**options))
          |    end
        }.unindent)
    end

    it 'creates action docs' do
      is_expected
        .to include('This method creates an instance of {Dummy::Actions::Abusefiltercheckmatch} action.')
        .and include("api.abusefiltercheckmatch(filter: 'value')")
        .and include(
          "  # Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event."
        )
    end

    it 'creates initialize param docs' do
      is_expected
        .to include('  # @option defaults [Integer] maxlag Maximum lag can be used when MediaWiki is installed on a database replicated cluster.')

    end
  end
end
