require_relative 'database'
require_relative 'site'

db = Database.new
site = Site.new(Selenium::WebDriver.for :chrome)

db.clear_table

db.write(site.load_table)

value = [['testname1', '123456789', '1234.98'], ['testname2', '123456789', '1234.98']]
db.write(value)

table_from_bd = db.read

4.times { site.driver.find_element(xpath: '//tbody/tr[1]/td[4]/a').click }

site.add_to_table(table_from_bd)
