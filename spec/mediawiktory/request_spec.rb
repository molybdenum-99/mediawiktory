module MediaWiktory
  describe Request do
    describe 'setting param - basic behavior' do
      let(:klass){
        Class.new(Request) do
          boolean :param1
        end
      }

      let(:request){klass.new}

      describe :set! do
        it 'allows to set value' do
          expect(request.params[:param1]).to be_nil
          request.set!(:param1, true)
          expect(request.params[:param1]).to eq true
        end

        it 'checks/converts type' do
          request.set!(:param1, 'true')
          expect(request.params[:param1]).to eq true
        end

        it 'checks name' do
          expect{request.set!(:aram1, true)}.to raise_error(ArgumentError, /aram1/)
        end
      end

      describe :set do
        it 'does not change origin' do
          changed = request.set(:param1, true)

          expect(request.params[:param1]).to be_nil
          expect(changed.params[:param1]).to eq true
        end
      end

      describe 'method definitions' do
        it 'works!' do
          changed = request.param1(true)

          expect(request.params[:param1]).to be_nil
          expect(changed.params[:param1]).to eq true
        end
      end

      describe 'set on init' do
        it 'sets' do
          request = klass.new(param1: true)
          expect(request.params[:param1]).to eq true
        end

        it 'checks and converts' do
          request = klass.new(param1: 'true')
          expect(request.params[:param1]).to eq true
        end

        it 'raises on unknown' do
          expect{klass.new(aram1: true)}.to raise_error(ArgumentError, /aram1/)
        end
      end

    end
  end
end

__END__
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
