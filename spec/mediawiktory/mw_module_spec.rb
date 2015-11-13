require 'mediawiktory/mw_module'

module MediaWiktory
  describe MWModule do
    let!(:mod1){
      Class.new(MWModule){
        symbol :mod1

        r_attribute :foo, Integer
      }
    }
    let!(:mod2){
      Class.new(MWModule){
        symbol :mod2

        r_attribute :bar, String
      }
    }
    let(:klass){
      Class.new(MWModule){
        # single values
        r_attribute :export, Axiom::Types::Boolean
        r_attribute :max_age, Integer
        r_attribute :limit, IntegerOrMax
        r_attribute :limit2, IntegerOrMax
        r_attribute :dir, Enum[:ascending, :descending]
        r_attribute :mod, ModuleAttr[:mod1, :mod2]

        # lists
        r_attribute :titles, Array[String]
        r_attribute :pageids, Array[Integer]
        r_attribute :clprop, Enum.list(:sortkey, :timestamp, :hidden)
        r_attribute :mods, ModuleAttr.list(:mod1, :mod2)
      }
    }
    
    describe 'construction' do
      it 'converts all attributes' do
        mod = klass.new(
          export: 'true',
          max_age: '100',
          limit: '20',
          limit2: 'max',
          dir: :ascending,
          
          titles: ['Argentina', 'Chile'],
          pageids: ['123', '456'],
          clprop: ['sortkey', 'timestamp'] 
        )
        expect(mod.export).to eq true
        expect(mod.max_age).to eq 100
        expect(mod.limit).to eq 20
        expect(mod.limit2).to eq 'max'
        expect(mod.dir).to eq :ascending
        expect(mod.titles).to eq ['Argentina', 'Chile']
        expect(mod.pageids).to eq [123, 456]
        expect(mod.clprop).to eq [:sortkey, :timestamp]
      end

      context 'module' do
        it 'converts symbol to module' do
          mod = klass.new(mod: :mod1)
          expect(mod.mod).to be_instance_of(mod1)
        end

        it 'converts hash to module' do
          mod = klass.new(mod: {mod1: {foo: 1}})
          expect(mod.mod).to be_instance_of(mod1)
          expect(mod.mod.foo).to eq 1
        end

        it 'fails gracefully on unexpected arguments'
      end

      context 'modules' do
        it 'is initialized with any mix of symbols and hashes' do
          mod = klass.new(mods: [:mod1, {mod2: {bar: 'foo'}}])
          expect(mod.mods).to be_kind_of(Array)
          expect(mod.mods.count).to eq 2
          expect(mod.mods.first).to be_instance_of(mod1)
          expect(mod.mods.last).to be_instance_of(mod2)
          expect(mod.mods.last.bar).to eq 'foo'
        end

        it 'fails gracefully if something went wrong'
      end

      it 'raises on wrong enum values'

      it 'raises on unknown attributs'
    end

    describe 'chainable setters' do
      let(:mod){klass.new(export: true)}
      
      it 'works as a getter without argument' do
        expect(mod.export).to eq true
      end

      it 'works as a setter with argument' do
        m2 = mod.export(false)
        expect(m2.export).to eq false
        expect(mod.export).to eq true
      end

      it 'works as a smart setter for arrays' do
        m2 = mod.titles('Argentine', 'Chile')
        expect(m2.titles).to eq ['Argentine', 'Chile']
        expect(mod.titles).to eq []
      end

      it 'works as an super-duper smart setter for modules' do
        m2 = mod.mods(:mod1, mod2: {bar: 'foo'})
        expect(m2.mods.first).to be_instance_of(mod1)
        expect(m2.mods.last).to be_instance_of(mod2)
      end
    end

    describe :to_param do
    end
  end
end
