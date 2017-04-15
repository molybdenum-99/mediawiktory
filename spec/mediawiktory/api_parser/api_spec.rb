require 'mediawiktory/api_parser'

RSpec.describe MediaWiktory::ApiParser::Api do
  describe '.from_html' do
    let(:source) { File.read('spec/fixtures/api.php.html') }

    subject(:api) { described_class.from_html(source) }

    describe '#actions' do
      subject { api.actions }

      it { is_expected.to be_an(Array).and have_attributes(size: 116).and all be_a(MediaWiktory::ApiParser::Module) }
      its_map(:name) { is_expected.to include('edit', 'query', 'delete') }
    end
  end

  describe '.from_url' do
    it 'fetches API version/sitename' do
    end

    it 'fetches full API html and parses it' do
    end
  end
end
