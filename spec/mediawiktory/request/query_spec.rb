module MediaWiktory
  describe QueryRequest do
    describe 'construction' do
      context 'from hash' do
        subject{QueryRequest.new(prop: {revisions: :content}, titles: %w[Argentine Chile], redirects: true)}

        its(:'prop.first.name'){should == :revisions}
        its(:titles){should == %w[Argentine Chile]}
        its(:redirects){should == true}
      end

      context 'from chain' do
        subject{QueryRequest.new.prop(revisions: :content).titles('Argentine', 'Chile').redirects(true)}

        its(:'prop.first.name'){should == :revisions}
        its(:titles){should == %w[Argentine Chile]}
        its(:redirects){should == true}
      end
    end

    describe :to_hash do
    end

    describe :to_query_hash do
    end
  end
end
