require 'pg'
require 'dotenv/load'

def connect_to_db
  PG.connect(host: ENV['DB_HOST'],
    port: ENV['DB_PORT'],
    user: ENV['DB_USERNAME'],
    password: ENV['DB_PASSWORD'],
    dbname: ENV['DB_NAME'])
end
