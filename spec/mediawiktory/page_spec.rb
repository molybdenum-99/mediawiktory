module MediaWiktory
  describe Page do
    let(:raw){Hashie::Mash.new(JSON.parse(read_fixture('argentina.json')))}
    subject(:page){Page.new(raw)}
    
    describe 'params proxying' do
      its(:pageid){should == 18951905}
      its(:id){should == 18951905}
      its(:title){should == 'Argentina'}
      its(:fullurl){should == 'https://en.wikipedia.org/wiki/Argentina'}
      
      it 'fails on non-existing param' do
        expect{page.something}.to raise_error(KeyError, /something/)
      end
    end

    describe :content do
      context 'when revisions key exists' do
        its(:content){should == raw.revisions.first['*']}
      end

      context 'when there is no revisions key' do
      end
    end

    describe 'missing/invalid pages' do
      let(:raw){Hashie::Mash.new(JSON.parse(read_fixture('missing.json')))}
      it{should be_missing}
      it{should_not be_exists}
      its(:title){should == 'Argentinfa'}
      its(:id){should be_nil}
      it 'fails on any query except title' do
        expect{page.fullurl}.to raise_error(RuntimeError, /Argentinfa.+missing/)
      end
    end

    describe :merge! do
      let(:raw_cont){Hashie::Mash.new(JSON.parse(read_fixture('argentina_cont.json')))}
      let(:page_cont){Page.new(raw_cont)}

      before{
        page.merge!(page_cont)
      }

      it 'updates arrays' do
        expect(page.categories.count).to eq 20
        expect(page.categories.last.title).to eq "Category:Articles with dead external links from June 2015"
      end

      it 'checks id' do
        raw_cont.pageid += 1
        page_cont = Page.new(raw_cont)
        expect{page.merge!(page_cont)}.to raise_error(ArgumentError, /pageid/)
      end
    end
  end
end
