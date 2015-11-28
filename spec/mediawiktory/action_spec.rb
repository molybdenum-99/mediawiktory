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
        expect(client).to receive(:get).with(
          'action' => 'query',
          'export' => 'true',
          'format' => 'json').
          and_return(response_data.to_json)

        response = action.perform
        expect(response).to be_kind_of(Action::Response)
        expect(response.to_h).to eq response_data
      end
    end
  end
end
