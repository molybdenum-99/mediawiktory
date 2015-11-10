__END__
    describe 'accepting parameters' do
      let(:request){QueryRequest.new}

      describe 'basic func' do
        let!(:changed){request.export(true)}

        describe 'source' do
          subject{request}
          its(:params){should_not include(:export)}
        end

        describe 'changed' do
          subject{changed}
          its(:params){should include(export: true)}
        end
      end
      
      shared_examples 'array of module param' do
      end

      shared_examples 'boolean param' do |param|
        it 'allows to set itself' do
          expect(request.send(param, true).to_hash).to include(param.to_s => true)
        end
        it 'allows to unset itself' do
          expect(request.
            send(param, true).    # setting
            send(param, false).   # unsetting
            to_hash).not_to include(param.to_s)
        end
      end

      shared_examples 'array of strings param' do |param|
        let(:values){3.times.map{Faker::Lorem.word}}
        it 'allows to set' do
          expect(request.send(param, *values).to_hash).to include(param.to_s => values)
        end
      end
      
      shared_examples 'array of ints param' do |param|
        let(:values){3.times.map{rand(100)}}
        it 'allows to set' do
          expect(request.send(param, *values).to_hash).to include(param.to_s => values)
        end
      end

      shared_examples 'module enum param' do
      end
      
      context :prop do
        #it_should_behave_like 'array of module param'

        context 'single value(s)' do
          it 'accepts known values' do
            expect(request.prop(:categories, :revisions).to_hash).to \
              include('prop' => {'categories' => {}, 'revisions' => {}})
          end

          it 'raises on unknown values' do
            expect{request.prop(:categoies)}.to raise_error(ArgumentError, /categoies/)
          end
        end

        context 'hash' do
        end

        context 'mixed values' do
        end
      end
      
      context :list do
        it_should_behave_like 'array of module param'
      end
      
      context :meta do
        it_should_behave_like 'array of module param'
      end
      
      context :indexpageids do
        it_should_behave_like 'boolean param', :indexpageids
      end

      context :export do
        it_should_behave_like 'boolean param', :export
      end

      context :exportnowrap do
        it_should_behave_like 'boolean param', :exportnowrap
      end

      context :iwurl do
        it_should_behave_like 'boolean param', :iwurl
      end

      context :titles do
        it_should_behave_like 'array of strings param', :titles
      end

      context :pageids do
        it_should_behave_like 'array of ints param', :pageids
      end

      context :revids do
        it_should_behave_like 'array of ints param', :revids
      end

      context :redirects do
        it_should_behave_like 'boolean param', :redirects
      end

      context :converttitles do
        it_should_behave_like 'boolean param', :converttitles
      end
    end

    describe 'providing metainfo on parameters' do
    end
    
    #describe 'construction' do
      #context 'from hash' do
        #subject{QueryRequest.new(prop: {revisions: :content}, titles: %w[Argentine Chile], redirects: true)}

        #its(:'prop.first.name'){should == :revisions}
        #its(:titles){should == %w[Argentine Chile]}
        #its(:redirects){should == true}
      #end

      #context 'from chain' do
        #subject{QueryRequest.new.prop(revisions: :content).titles('Argentine', 'Chile').redirects(true)}

        #its(:'prop.first.name'){should == :revisions}
        #its(:titles){should == %w[Argentine Chile]}
        #its(:redirects){should == true}
      #end

      #context 'validation' do
        #context 'when wrong param type'
        #context 'when unacceptable param value'
        #context 'when mandatory param ommited'
      #end
    #end

    #describe :to_hash do
    #end

    #describe :to_query_hash do
    #end
  end
end
