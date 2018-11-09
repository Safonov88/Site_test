require 'pg'
require 'dotenv/load'

def connect_to_db
  PG.connect(host: ENV['DB_HOST'],
    port: ENV['DB_PORT'],
    user: ENV['DB_USERNAME'],
    password: ENV['DB_PASSWORD'],
    dbname: ENV['DB_NAME'])
end

def write_to_db(table)
  value = table.map { |t| "('#{t[0]}', #{t[1]}, #{t[2]})" }.join(',')
  connect_to_db.exec("INSERT INTO shopping_list (name, count, price) VALUES #{value}")
end
