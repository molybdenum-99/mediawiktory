module MediaWiktory
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
          'format' => 'json')

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
            'format' => 'json')

          action.perform
        end
      end
      
      it 'constructs response'
    end
  end
end
