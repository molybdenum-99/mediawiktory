module MediaWiktory
  describe Action do
    subject(:action) { described_class.new(client) }

    let(:client) { double }

    describe '#initialize' do
      subject { described_class.new(client, format: :json, version: 1) }
      its(:to_h) { is_expected.to eq('format' => 'json', 'version' => '1') }
    end

    describe '#merge' do
      subject { action.merge(format: :json, version: 1) }

      it { is_expected.to be_a described_class }
      its(:client) { is_expected.to be client }
      its(:to_h) { is_expected.to eq('format' => 'json', 'version' => '1') }
      it 'does not change source' do
        expect(action.to_h).to be_empty
      end
    end

    describe '#module_to_hash' do
      subject { action.send(:module_to_hash, :format, *args) }

      context 'just symbol passed' do
        let(:args) { [:json] }

        it { is_expected.to eq('format' => 'json') }
      end

      context 'with params' do
        let(:args) { [json: {callback: 'wikiresponse'}] }

        it { is_expected.to eq('format' => 'json', 'callback' => 'wikiresponse') }
      end

      context 'with prefix' do
        let(:args) { [{json: {callback: 'wikiresponse'}}, prefix: 'j'] }

        it { is_expected.to eq('format' => 'json', 'jcallback' => 'wikiresponse') }
      end

      context 'with boolean param' do
        let(:args) { [{json: {callback: 'wikiresponse', ascii: val}}, prefix: 'j'] }

        context 'true' do
          let(:val) { true }
          it { is_expected.to eq('format' => 'json', 'jcallback' => 'wikiresponse', 'jascii' => 'true') }
        end

        context 'false' do
          let(:val) { false }
          it { is_expected.to eq('format' => 'json', 'jcallback' => 'wikiresponse') }
        end
      end
    end

    describe '#modules_to_hash' do
    end

    describe '#to_param' do
      let(:action) { described_class.new(client, 'format' => 'json') }
      subject { action.to_param }
      before { allow(described_class).to receive(:name).and_return('QueryAction') }

      it { is_expected.to eq('action' => 'query', 'format' => 'json') }
    end

    describe '#perform' do
      before { allow(action_class).to receive(:name).and_return('QueryAction') }
      let(:action) { action_class.new(client, 'format' => 'json') }

      subject { action.perform }

      context 'default' do
        let(:action_class) { described_class }
        its_call { is_expected.to raise_error NotImplementedError }
      end

      context 'get' do
        let(:action_class) { GetAction }
        its_call { is_expected.to send_message(client, :get).with('action' => 'query', 'format' => 'json') }
      end

      context 'post' do
        let(:action_class) { PostAction }
        its_call { is_expected.to send_message(client, :post).with('action' => 'query', 'format' => 'json') }
      end
    end
  end
end

__END__
  describe Action do
    let(:client){instance_double(Client)}
    let(:klass){
      Class.new(Action){
        symbol :query

        param :export, Params::Boolean
      }
    }

    describe 'chainable creation' do
      subject{klass.new(client).export(true)}
      its(:client){should == client}
      its(:export){should == true}
    end

    describe :perform do
      let(:action){
        klass.new(client, export: true)
      }
      it 'calls client' do
        expect(client).to receive(:get).with(
          'action' => 'query',
          'export' => 'true',
          'format' => 'json').and_return('{}')

        action.perform
      end

      context 'when post' do
        before{
          klass.post!
        }

        it 'calls client' do
          expect(client).to receive(:post).with(
            'action' => 'query',
            'export' => 'true',
            'format' => 'json').and_return('{}')

          action.perform
        end
      end

      let(:response_data){{
        'meta' => {
          'continue' => '||'
        },
        'query' => {
          'pages' => {
            '123' => {'title' => 'Foo'},
            '456' => {'title' => 'Bar'}
          }
        }
      }}

      it 'constructs response' do
        expect(client).to receive(:get).
          with(
          'action' => 'query',
          'export' => 'true',
          'format' => 'json').
          and_return(response_data.to_json)

        response = action.perform

        expect(response).to be_kind_of(Action::Response)
        expect(response.action).to eq action

        expect(response.to_h).to eq response_data

        expect(response.raw).to eq response_data
        expect(response.raw).to be_kind_of Hashie::Mash

      end
    end

    describe Action::Response do
      subject { Action::Response.new('Query instance', raw) }

      context 'when response contains error' do
        let(:raw) { {"error"=>{"code"=>"gcmmissingparam", "info"=>"One of the parameters cmtitle, cmpageid is required", "*"=>"See https://en.wikipedia.org/w/api.php for API usage"}} }

        it 'raises error' do
          expect { subject }.to raise_exception(Action::RequestError)
        end
      end

      context 'when response contains warning' do
        let(:raw) { {"warnings"=>{"search"=>{"*"=>"gsrlimit may not be over 50 (set to 100) for users"}}} }

        it 'allows access warnings' do
          expect(subject.warnings).to be_kind_of(Hashie::Mash)
        end
      end
    end
  end
end
