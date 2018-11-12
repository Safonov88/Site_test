require 'rspec'
require 'pg'
require 'dotenv/load'
require_relative '../database'

describe 'Database' do
  let(:db) { Database.new }
  let(:pg) {PG.connect(
              host: ENV['DB_HOST'],
              port: ENV['DB_PORT'],
              user: ENV['DB_USERNAME'],
              password: ENV['DB_PASSWORD'],
              dbname: ENV['DB_NAME']
            )}

  it 'checks write in db' do
    value = [['testname', '123456789', '1234.98']]
    db.write(value)

    expect(
      pg.exec("SELECT * FROM shopping_list WHERE name = 'testname' AND count = 123456789 AND price = 1234.98").any?
      ).to be_truthy
  end
end
