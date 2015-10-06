module MediaWiktory
  describe Request do
    context 'construction' do
      context 'action' do
        subject{Request.new(:query)}
        its(:action){should == :query}
        its(:query_hash){should == {action: :query}}
      end

      context 'simple params' do
        subject{Request.new(:query, prop: :categories)}
        its(:query_hash){should == {action: :query, prop: 'categories'}}
      end

      context 'nested params' do
        subject{Request.new(:query, prop: {categories: {clprop: [:sortkey,:timestamp]}})}
        its(:query_hash){should == {action: :query, prop: 'categories', clprop: 'sortkey|timestamp'}}
      end
    end

    context 'validation' do
      context 'unknown action' do
      end

      context 'unknown param' do
      end

      context 'missing param' do
      end
    end

    context 'performing' do
    end
  end
end
