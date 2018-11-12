require 'rspec'
require 'pg'
require 'dotenv/load'
require_relative '../database'

describe 'Database' do
  let(:db) { Database.new }
  let(:pg) { PG.connect(
               host: ENV['DB_HOST'],
               port: ENV['DB_PORT'],
               user: ENV['DB_USERNAME'],
               password: ENV['DB_PASSWORD'],
               dbname: ENV['DB_NAME']
              )
            }

  before(:each) { pg.exec('TRUNCATE TABLE shopping_list') }

  it 'checks write in db' do
    value = [['testname', '123456789', '1234.98']]
    db.write(value)

    expect(
      pg.exec("SELECT * FROM shopping_list WHERE name = 'testname' AND count = 123456789 AND price = 1234.98").any?
      ).to be_truthy
  end

  it 'checks table is clear' do
    pg.exec("INSERT INTO shopping_list (name, count, price) VALUES ('testname', 123456789, 1234.98)")

    expect{ db.clear_table }
      .to change{ pg.exec("SELECT * from shopping_list").any? }
      .from(be_truthy).to(be_falsey)
  end

  it 'checks read from db' do
    pg.exec("INSERT INTO shopping_list (name, count, price)
              VALUES ('testname1', 123456789, 1234.98), ('testname2', 123456789, 1234.98)")

    expect(db.read.count).to eq(2)
  end
end
