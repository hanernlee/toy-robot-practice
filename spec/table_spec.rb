describe Table do
  context 'when simulator runs' do

    it 'creates default 5 x 5 table' do
      table = Table.new
      expect(table.length).to eq 5
      expect(table.width).to eq 5
    end

    it 'creates dynamic width x length table' do
      table = Table.new(7,8)
      expect(table.length).to eq 7
      expect(table.width).to eq 8
    end
  end
end
