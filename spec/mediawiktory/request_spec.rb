module MediaWiktory
  describe Request do
    let(:klass){
      Class.new(Request){
        # single values
        r_attribute :export, Axiom::Types::Boolean
        r_attribute :max_age, Integer
        r_attribute :limit, IntegerOrMax
        r_attribute :limit2, IntegerOrMax
        r_attribute :dir, Enum[:ascending, :descending]
        # TODO: module

        # lists
        r_attribute :titles, Array[String]
        r_attribute :pageids, Array[Integer]
        r_attribute :clprop, Array[Enum[:sortkey, :timestamp, :hidden]]
      }
    }
    
    describe 'construction' do
      it 'converts all attributes' do
        req = klass.new(
          export: 'true',
          max_age: '100',
          limit: '20',
          limit2: 'max',
          dir: :ascending,
          
          titles: ['Argentina', 'Chile'],
          pageids: ['123', '456']
          #clprop: ['sortkey', 'timestamp'] FIXME, virtus!
        )
        expect(req.export).to eq true
        expect(req.max_age).to eq 100
        expect(req.limit).to eq 20
        expect(req.limit2).to eq 'max'
        expect(req.dir).to eq :ascending
        expect(req.titles).to eq ['Argentina', 'Chile']
        expect(req.pageids).to eq [123, 456]
        #expect(req.clprop).to eq [:sortkey, :timestamp] FIXME, virtus!
      end

      it 'raises on wrong enum values' do
      end

      it 'raises on unknown attributs' do
      end
    end

    describe 'chainable setters' do
      let(:req){klass.new(export: true)}
      
      it 'works as a getter without argument' do
        expect(req.export).to eq true
      end

      it 'works as a setter with argument' do
        req2 = req.export(false)
        expect(req2.export).to eq false
        expect(req.export).to eq true
      end

      it 'works as a smart setter for arrays' do
      end
    end

    describe :to_param do
    end
  end
end

__END__
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

    describe 'different types of params' do
      shared_examples 'param type behavior' do
        it 'converts parameter' do
        end

        it 'throws on unacceptable value' do
        end
      end
      
      context :boolean do
      end

      context :string do
      end

      context :int do
      end

      context :int_or_str do
        let(:convert){ {'1' => 1, 'max' => 'max'} }
      end

      context :str_list do
      end

      context :str_one_of do
      end

      context :int_list do
      end

      context :module_list do
      end

      context :module_one_of do
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
