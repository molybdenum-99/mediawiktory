module MediaWiktory
  describe ArrayWithKeys do
    let(:hash){{
      'one' => 1,
      'two' => 2,
      'three' => 3
    }}
    subject(:a){ArrayWithKeys.from_hash(hash)}

    it 'behaves as array' do
      expect(a.count).to eq hash.count
      expect(a.first).to eq hash.values.first
      expect(a[0]).to eq hash.values[0]
      expect(a.each.to_a).to eq hash.values
    end

    it 'behaves as hash' do
      expect(a.keys).to eq hash.keys
      expect(a['one']).to eq hash['one']
      expect(a.to_h).to eq hash
    end
  end
end
