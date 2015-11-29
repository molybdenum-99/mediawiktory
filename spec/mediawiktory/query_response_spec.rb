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
        subject{Query::Response.from_json(action, read_fixture('query-pages.json'))}
        it{should be_continue}
      end

      context 'when there is no more' do
        subject{Query::Response.from_json(action, read_fixture('query-pages-last.json'))}
        it{should_not be_continue}
      end
    end

    describe :continue! do
      let(:response){Query::Response.from_json(action, read_fixture('query-pages.json'))}

      before{
        expect(action.client).to receive(:get).
          with(action.to_param.merge(response.raw.continue)).
          and_return(read_fixture('query-pages-last.json'))

        response.continue!
      }
      
      it 'fetches new pages' do
        expect(response.pages.count).to eq 11
        expect(response.pages.last.title).to eq "Category:Venezuela"
      end

      it 'enriches old pages' do
        expect(response.pages['18951905'].categories.count).to eq 2
      end

      it 'updates continue info' do
        expect(response).not_to be_continue
      end

      it 'fails on no continue info' do
        expect{response.continue!}.to raise_error(RuntimeError, /continue/)
      end
    end

    describe :continue do
      before{
        expect(action.client).to receive(:get).
          with(action.to_param.merge(original.raw.continue)).
          and_return(read_fixture('query-pages-last.json'))
      }
      
      let(:original){Query::Response.from_json(action, read_fixture('query-pages.json'))}
      let!(:continued){original.continue}

      it 'has updated data in returned response' do
        expect(continued.pages.count).to eq 11
        expect(continued).not_to be_continue
      end
      
      it 'preserves original response' do
        expect(original.pages.count).to eq 10
        expect(original).to be_continue
      end
    end

    describe :continue_all! do
    end

    describe :continue_all do
    end
  end
end
