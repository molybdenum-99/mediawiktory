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
