module MediaWiktory
  describe Client do
    let(:url){'http://en.wikipedia.org/w/api.php'}
    
    context 'creation' do
      subject{Client.new(url)}
      its(:'url.to_s'){should == url}

      # TODO:
      # * default URL?
      # * default path to api.php
      # * params: format, assert, uselang (and more)
    end

    context 'call to API' do
      before{
        stub_request(:any, /#{url}.*/).to_return(body: 'stub')
      }
      let(:client){Client.new(url)}
      
      it 'GETs' do
        expect(client.get(action: :query, prop: :revision).body).to eq 'stub'
        expect(WebMock).to have_requested(:get, url).
          with(query: {'action' => 'query', 'prop' => 'revision'})
      end

      context 'POST' do
      end

      context 'preserving cookies' do
      end
    end

    context 'request construction' do
    end
  end
end
