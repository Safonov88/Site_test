class Database
  require 'pg'
  require 'dotenv/load'

  def initialize
    @db = PG.connect(host: ENV['DB_HOST'],
      port: ENV['DB_PORT'],
      user: ENV['DB_USERNAME'],
      password: ENV['DB_PASSWORD'],
      dbname: ENV['DB_NAME'])
  end

  def write_to_db(table)
    value = table.map { |t| "('#{t[0]}', #{t[1]}, #{t[2]})" }.join(',')
    @db.exec("INSERT INTO shopping_list (name, count, price) VALUES #{value}")
  end

  def clear_table
    @db.exec('TRUNCATE TABLE shopping_list')
  end
end
