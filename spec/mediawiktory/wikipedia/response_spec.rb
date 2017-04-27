require 'mediawiktory/wikipedia/response'

module MediaWiktory
  describe Wikipedia::Response do
    subject(:response) { described_class.new(action, JSON.parse(hash.to_json)) }
    let(:action) { instance_double('MediaWiktory::Wikipedia::Action', name: 'query') }

    describe '.parse' do
      let(:hash) { {query: {}} }
      subject(:response) { described_class.parse(action, hash.to_json) }
    end

    describe '#initialize' do
      context 'with errors' do
        let(:hash) { {error: {code: 'invalidcategory', info: 'The category name you entered is not valid.'}} }

        its_call { is_expected.to raise_error('The category name you entered is not valid.') }
      end

      context 'without errors' do
        let(:hash) { {query: {}} }
        its_call { is_expected.not_to raise_error }
      end
    end

    describe '#to_h' do
      let(:hash) { {query: {foo: 'bar'}, dummy: {bar: 'baz'}, continue: {gcmcontinue: 'something'}} }

      its(:to_h) { is_expected.to eq('foo' => 'bar') }
    end

    describe '#raw' do
      let(:hash) { {query: {foo: 'bar'}, dummy: {bar: 'baz'}, continue: {gcmcontinue: 'something'}} }

      its(:raw) { is_expected.to eq(JSON.parse(hash.to_json)) }
    end

    describe '#continue?' do
      context 'has continue key' do
        let(:hash) { {query: {foo: 'bar'}, continue: {gcmcontinue: 'something'}} }
        its(:continue?) { is_expected.to be true }
      end

      context 'no continue key' do
        let(:hash) { {query: {foo: 'bar'}} }
        its(:continue?) { is_expected.to be false }
      end
    end

    describe '#continue' do
      subject { response.continue }

      context 'when there is next page' do
        let(:hash) { {query: {foo: 'bar'}, continue: {gcmcontinue: 'something'}} }
        before {
          expect(action).to receive(:merge).with('gcmcontinue' => 'something').and_return(action)
          expect(action).to receive(:perform).and_return(next_page.to_json)
        }
        let(:next_page) { {query: {bar: 'baz'}} }

        its(:to_h) { is_expected.to eq('foo' => 'bar', 'bar' => 'baz') }
        its(:raw) { is_expected.to eq('query' => {'foo' => 'bar', 'bar' => 'baz'}) }
        its(:continue?) { is_expected.to be false }

        context 'original response' do
          before { response.continue }
          subject { response }
          its(:to_h) { is_expected.to eq('foo' => 'bar') }
        end
      end

      context 'when there are nothing to continue' do
        let(:hash) { {query: {foo: 'bar'}} }

        its_call { is_expected.to raise_error }
      end
    end

    describe '#warnings' do
    end
  end
end
