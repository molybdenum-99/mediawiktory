module MediaWiktory
  describe Action do
    let(:client){instance_double(Client)}
    let(:klass){
      Class.new(Action){
        symbol :query

        param :export, Params::Boolean
      }
    }

    describe :initialize do
      it 'behaves like a module'
    end

    describe :perform do
      let(:action){
        klass.new(client, export: true)
      }
      it 'calls client' do
        expect(client).to receive(:get).with(
          'action' => 'query',
          'export' => 'true',
          'format' => 'json')

        action.perform
      end
      
      it 'constructs response'
    end
  end
end
