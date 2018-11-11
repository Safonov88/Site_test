require_relative 'database'
require_relative 'site'

db = Database.new
site = Site.new

db.write(site.load_table)
