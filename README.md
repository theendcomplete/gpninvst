# Invest API

## Стэк

- PostgreSQL (https://www.postgresql.org/)
- Ruby on Rails (http://rubyonrails.org/)

## Интеграция

Осуществляется при помощи Capistrano (http://capistranorb.com/).

## Песочница

Для отладки и тестирования доступна песочница по адресу https://api.invest.alpha.trinitydigital.ru, обновление сервера осуществляется двумя путями:

- Загрузка обновлений в ветку `alpha`: `git checkout alpha && git merge changeset && git push origin alpha`
- Непосредственный вызов задачи `deploy`: `git checkout alpha && bundle install && bundle exec cap alpha deploy`

## Код

Общие рекомендации по стилю кодирования: https://github.com/bbatsov/ruby-style-guide

## Пагинация

Используется gem kaminari (https://github.com/kaminari/kaminari)

## Дата и время

Все временные метки форматируются в https://en.wikipedia.org/wiki/ISO_8601

## Редактирование секретного хранилища

`RAILS_ENV=production && rails encrypted:edit config/secrets.$RAILS_ENV.yml.enc -k config/secrets.$RAILS_ENV.key`

## Запуск локально

Создаем БД PostgreSQL:

```sql
sudo su postgres
psql
CREATE USER invest;
ALTER ROLE invest SUPERUSER;
ALTER USER invest WITH PASSWORD 'invest';
CREATE DATABASE invest OWNER invest;
```

Создаем конфиг окружения:
`nano .rails-env`
Содержимое файла:
`development`

Устанавливаем зависимости:
`bundle install`

Запускаем миграции:
`rails db:migrate`

Запускаем миграции данных:
`RAILS_ENV=development rails db:seed`

Запуск:
`rails s`

## Правка шаблона письма
Взять образец верстки из папки `doc`

Изменить стили в `<head> <style>`

Прогнать через онлайн-инлайнер, например `https://templates.mailchimp.com/resources/inline-css/`
