# Тестовое задание.

## Для корректной работы приложения нужно:
1. Установить следующие gem:
* selenium-webdriver
* rspec
* pg
* dotenv

2. Развернуть базу данных PostgreSQL и создать таблицу shopping_list
3. Создать в каталоге ruby_test файл с названием .env следующего содержания:
```
DB_NAME=name_db
DB_USERNAME=user
DB_PASSWORD=123
DB_HOST=localhost
DB_PORT=5432
```
где вместо name_db название своей базы данных, вместо user имя пользователя БД, вместо 123 - пароль пользователя и т.д.


## Программа состоит из следующих компонентов:
* database.rb Класс для работы с базой данных. Устанавливает подключение с БД, может читать данные из таблицы БД, записывать данные в таблицу БД и очищать таблицу БД.
* site.rb Класс для работы с сайтом. Служит для взаимодействия с сайтом, может загружать данные и добавлять данные в/из таблицы на сайте. 
* main.rb Содержит последовательность действий, при которой программа: очистит таблицу shopping_list в БД, загрузит данные с сайта в БД, добавит в БД два тестовых значения, заново выгрузит данные из БД и запишет их в таблицу на сайте, предварительно удалив значения в таблице на сайте.
* /spec Каталог содержащий файлы: site_spec.rb, database_spec.rb и test_case_spec.rb.
  * site_spec.rb Содержит тесты для класса Site.
  * database.rb Содержит тесты для класса Database.
  * test_case_spec.rb Содержит тесты для проверки функционала сайта ['Терешкова'](http://tereshkova.test.kavichki.com)
  
## Запуск main.rb.

Для запуска main.rb нужно в консоли зайти в каталог ruby_test.

Ввести команду ruby main.rb.

Программа выполнит алгоритм действий описанный в описании данного файла.

## Запуск тестирования сайта.

Для запуска тестирования нужно в консоли зайти в каталог ruby_test.

Ввести команду rspec spec/test_case_spec.rb

Программа произведёт тестирование сайта и по завершении тестирования выдаст отчёт по полученным ошибкам.

![screen](https://i98.fastpic.ru/big/2018/1112/70/704276a4eb54d140c2d3605b81c5db70.png "screen")
