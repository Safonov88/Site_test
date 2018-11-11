require 'selenium-webdriver'

class Site
  URL = 'http://tereshkova.test.kavichki.com/'

  def initialize(driver)
    @driver = driver

    @driver.get(URL)
  end

  def load_table
    table =
      @driver.find_elements(tag_name: :tr)
        .map{ |element| element.find_elements(tag_name: :td)
        .map(&:text) }

    table.delete_if(&:empty?)
  end

  def add_to_table(values)
    @driver.find_element(id: :open).click

    values.each do |value|
      @driver.find_element(id: :name).send_keys(value['name'])
      @driver.find_element(id: :count).send_keys(value['count'])
      @driver.find_element(id: :price).send_keys(value['price'])

      @driver.find_element(id: :add).click

      reset_form
    end
  end

  private

  def reset_form
    array_id = [:name, :count, :price]

    array_id.map{ |id| @driver.find_element(id: id).clear }
  end
end
