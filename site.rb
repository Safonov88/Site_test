require 'selenium-webdriver'

def load_table
  driver = Selenium::WebDriver.for :chrome

  driver.get('http://tereshkova.test.kavichki.com/')

  table = driver.find_elements(tag_name: :tr).map{ |element| element.find_elements(tag_name: :td).map(&:text) }
  table.delete_if(&:empty?)
end
