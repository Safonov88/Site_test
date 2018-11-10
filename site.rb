class Site
  require 'selenium-webdriver'

  def initialize
    @driver = Selenium::WebDriver.for :chrome

    @driver.get('http://tereshkova.test.kavichki.com/')
  end

  def load_table
    table = @driver.find_elements(tag_name: :tr).map{ |element| element.find_elements(tag_name: :td).map(&:text) }
    table.delete_if(&:empty?)
  end
end
