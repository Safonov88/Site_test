require_relative 'database'
require_relative 'site'

db = Database.new
site = Site.new(Selenium::WebDriver.for :chrome)

db.write(site.load_table)
