module MediaWiktory
  describe Wikipedia::Action do
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

    describe '#merge_module' do
      let(:json) { Module.new }
      let(:jsonfm) { Module.new }
      before {
        stub_const('Json', json)
        stub_const('Jsonfm', jsonfm)
      }
      let(:modules) { {json: Json, jsonfm: Jsonfm} }

      context 'simple merge' do
        subject { action.send(:merge_module, :format, :json, modules) }
        its(:to_h) { is_expected.to eq('format' => 'json') }
        it { is_expected.to be_a json }
      end

      context 'module not found' do
        subject { action.send(:merge_module, :format, :jsonrb, modules) }
        its_call { is_expected.to raise_error(ArgumentError) }
      end

      context 'with prefix' do
      end
    end

    describe '#merge_modules' do
      let(:json) { Module.new }
      let(:jsonfm) { Module.new }
      before {
        stub_const('Json', json)
        stub_const('Jsonfm', jsonfm)
      }
      let(:modules) { {json: Json, jsonfm: Jsonfm} }

      context 'simple merge' do
        subject { action.send(:merge_modules, :format, [:json], modules) }
        its(:to_h) { is_expected.to eq('format' => 'json') }
        it { is_expected.to be_a json }
      end

      context 'several modules' do
        subject { action.send(:merge_modules, :format, [:json, :jsonfm], modules) }
        its(:to_h) { is_expected.to eq('format' => 'json|jsonfm') }
        it { is_expected.to be_a json }
        it { is_expected.to be_a jsonfm }
      end

      context 'module not found' do
        subject { action.send(:merge_module, :format, [:jsonrb], modules) }
        its_call { is_expected.to raise_error(ArgumentError) }
      end

      context 'with prefix' do
      end
    end

    describe '#to_param' do
      let(:action) { described_class.new(client, 'format' => 'json') }
      subject { action.to_param }
      before { allow(described_class).to receive(:name).and_return('Query') }

      it { is_expected.to eq('action' => 'query', 'format' => 'json') }

      context 'multiword class' do
        before { allow(described_class).to receive(:name).and_return('ParsoidBatch') }

        it { is_expected.to eq('action' => 'parsoid-batch', 'format' => 'json') }
      end
    end

    describe '#perform' do
      before { allow(action_class).to receive(:name).and_return('Query') }
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
