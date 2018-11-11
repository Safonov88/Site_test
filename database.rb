require 'pg'
require 'dotenv/load'

class Database
  def initialize
    @db = PG.connect(host: ENV['DB_HOST'],
      port: ENV['DB_PORT'],
      user: ENV['DB_USERNAME'],
      password: ENV['DB_PASSWORD'],
      dbname: ENV['DB_NAME'])
  end

  def write(shoping_list)
    value = shoping_list.map { |row| "('#{row[0]}', #{row[1]}, #{row[2]})" }.join(',')
    @db.exec("INSERT INTO shopping_list (name, count, price) VALUES #{value}")
  end

  def clear_table
    @db.exec('TRUNCATE TABLE shopping_list')
  end

  def read(table = 'shopping_list')
    @db.exec("SELECT * FROM #{table}")
  end
end
