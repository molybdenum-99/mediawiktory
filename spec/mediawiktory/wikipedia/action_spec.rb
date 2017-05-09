module MediaWiktory
  describe Wikipedia::Actions::Base do
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

      context 'chain of merges' do
        subject { action.merge(format: 'json').merge(format: 'xml') }

        it { is_expected.to be_a described_class }
        its(:client) { is_expected.to be client }
        its(:to_h) { is_expected.to eq('format' => 'xml') }
      end

      context 'chain of merges: do not replace' do
        subject { action.merge(title: 'Argentina').merge(title: 'Bolivia', replace: false) }

        it { is_expected.to be_a described_class }
        its(:client) { is_expected.to be client }
        its(:to_h) { is_expected.to eq('title' => 'Argentina|Bolivia') }
      end
    end

    describe '#submodule' do
      let(:json) { Module.new }

      context 'simple merge' do
        subject { action.send(:submodule, json) }
        it { is_expected.to be_a json }
      end

      context 'after merging' do
        subject { action.send(:submodule, json).merge(foo: 'bar') }
        it { is_expected.to be_a json }
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
        let(:action_class) { Wikipedia::Actions::Get }
        its_call { is_expected.to send_message(client, :get).with('action' => 'query', 'format' => 'json') }
      end

      context 'post' do
        let(:action_class) { Wikipedia::Actions::Post }
        its_call { is_expected.to send_message(client, :post).with('action' => 'query', 'format' => 'json') }
      end
    end
  end
end
