require 'rspec'
require_relative '../site'

describe 'Site' do
  let(:site) { Site.new(Selenium::WebDriver.for :chrome) }

  after(:each) { site.driver.quit }

  it 'returns table' do
    expect(site.load_table).not_to eq([])
  end

  it 'checks added row to table' do
    value = [{'name' => 'testname', 'count' => 123456789, 'price' => 123456789.98}]

    site.add_to_table(value)

    expect(site.driver.find_element(xpath: '//tbody/tr[5]')).to be
  end

  it 'checks clear text fields in form' do
    site.driver.find_element(id: :open).click

    name = site.driver.find_element(id: :name)
    name.send_keys('testname')

    count = site.driver.find_element(id: :count)
    count.send_keys(123456789)

    price = site.driver.find_element(id: :price)
    price.send_keys(123456789.98)

    site.send(:reset_form)

    expect(name.text).to be_empty
    expect(count.text).to be_empty
    expect(price.text).to be_empty
  end
end
