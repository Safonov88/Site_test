require 'rspec'
require_relative '../site'

describe 'Site' do
  context 'when table is load' do
    let(:site) { Site.new }

    it 'returns ok' do
      expect(site.load_table).not_to eq([])
    end
  end
end
