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
