require 'rspec'
require_relative '../site'

describe 'Site' do
  let(:site) { Site.new(Selenium::WebDriver.for :chrome) }

  it 'returns table' do
    expect(site.load_table).not_to eq([])
  end

  it 'added row to table' do
    value = [{'name' => 'testname', 'count' => 123456789, 'price' => 123456789.98}]

    site.add_to_table(value)

    expect(site.driver.find_element(xpath: '//tbody/tr[5]')).to be
  end
end
