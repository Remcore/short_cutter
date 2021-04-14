# Запуск
1. Установить ruby 2.6.6 (asdf-vm), `gem install foreman`
2. Выполнить `cp .env.example .env`
3. Запустить `docker-compose up`
4. Выполнить `rails db:setup`
5. Запуск приложения: `foreman start`
6. Открыть в браузере `http://localhost:3000/urls`