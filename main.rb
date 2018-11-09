require_relative 'database'
require_relative 'site'

db = Database.new
site = Site.new

db.write_to_db(site.load_table)
