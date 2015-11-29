module MediaWiktory
  describe Query::Response do
    let(:client){Client.new('https://en.wikipedia.org/w/api.php')}
    let(:action){Query.new(client)}
    
    describe :pages do
      let(:response){Query::Response.from_json(action, read_fixture('query-pages.json'))}
      subject(:pages){response.pages}
      
      it 'behaves like array' do
        expect(pages.count).to eq 10
        expect(pages.first.title).to eq 'List of countries in the Americas by population'
        expect(pages[0].title).to eq 'List of countries in the Americas by population'
        expect(pages.each.to_a.first.title).to eq 'List of countries in the Americas by population'
      end

      it 'behaves like hash' do
        expect(pages.keys.first).to eq '7497826'
        expect(pages['18951905'].title).to eq 'Argentina'
      end
    end

    # FIXME: i'm still vague on whether (and how) sub-keys
    # for meta and lists should be grouped and processed
    xdescribe :meta do
      let(:response){Query::Response.from_json(action, read_fixture('query-meta.json'))}
      subject(:meta){response.meta}
      it 'groups meta-information' do
        expect(meta.general.sitename).to eq "Wikipedia"
      end
    end

    xdescribe :lists do
    end

    describe :continue? do
      context 'when there is more' do
      end

      context 'when there is no more' do
      end
    end

    describe :continue! do
      before{
        response.continue!
      }
      
      context 'fetching new pages' do
      end

      context 'enriching old pages' do
      end

      context 'updating continue info' do
      end

      context 'when nothing to continue on' do
      end
    end

    describe :continue do
      describe 'return value'
      describe 'original value'
    end

    describe :continue_all! do
    end

    describe :continue_all do
    end
  end
end
