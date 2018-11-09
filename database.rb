require 'pg'
require 'dotenv/load'

c = PG.connect(host: 'localhost', port: 5432, user: ENV['DB_USERNAME'], password: ENV['DB_PASSWORD'], dbname: ENV['DB_NAME'])
