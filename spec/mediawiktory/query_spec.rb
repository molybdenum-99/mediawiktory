module MediaWiktory
  describe Query do

    describe Query::Response do
      subject { Query::Response.new('Query instance', raw) }

      context 'when response is empty' do
        let(:raw) { {"batchcomplete"=>""} }

        it 'has empty pages' do
          expect(subject.pages).to eq([])
        end
      end
    end
  end
end
