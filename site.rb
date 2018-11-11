require 'selenium-webdriver'

class Site
  def initialize
    @driver = Selenium::WebDriver.for :chrome

    @driver.get('http://tereshkova.test.kavichki.com/')
  end

  def load_table
    table = @driver.find_elements(tag_name: :tr).map{ |element| element.find_elements(tag_name: :td).map(&:text) }
    table.delete_if(&:empty?)
  end

  def add_to_table(values)
    @driver.find_element(id: :open).click

    values.each do |value|
      @driver.find_element(id: :name).send_keys (value['name'])
      @driver.find_element(id: :count).send_keys (value['count'])
      @driver.find_element(id: :price).send_keys (value['price'])

      @driver.find_element(id: :add).click

      clear_text
    end
  end

  def clear_text
    id = [:name, :count, :price]

    id.map{ |i|  @driver.find_element(id: i).clear }
  end
end
