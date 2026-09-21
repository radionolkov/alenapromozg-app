# alenapromozg-app

Мини-приложение «Мозг» (Тест 2): `index.html`, отдаёт nginx в Railway (сервис `alenapromozg-app`), адрес —
`https://app.alenapromozg.ru/`. С Задачи 20 домен смотрит на прокси в России (описание — `docs/MOZG_PROJECT.md` в
`radionolkov/mozg-admin`, раздел «Прокси в России»), прокси пересылает всё сюда как есть.

## Всё с одного адреса

У части провайдеров в России не открываются ни Railway, ни telegram.org. Поэтому браузер человека ходит только на
`app.alenapromozg.ru`:

- `/telegram-web-app.js` — копия скрипта Telegram Mini Apps (`https://telegram.org/js/telegram-web-app.js`), лежит в
  репозитории;
- `/webhook/mozg-test2` (ответы теста) и `/webhook/mozg-result` («Получить результат») — `nginx.conf` пересылает их в
  те же вебхуки n8n (`https://n8n.alenapromozg.ru/webhook/...`); другие пути и методы, кроме POST, не пропускаются.

## Как обновить скрипт Telegram

Скрипт меняется редко; приложению нужны только `ready()`, `expand()`, `close()` и `initDataUnsafe.user`. Обновлять —
если Telegram добавил нужную возможность или сломал старую:

1. Скачать `https://telegram.org/js/telegram-web-app.js` (из России может не открываться — с другой сети) и положить
   вместо `telegram-web-app.js`.
2. Проверить, что это тот самый скрипт (начинается с `// WebView`, внутри `window.Telegram.WebApp`), записать ниже
   дату и SHA-256.
3. PR, мерж — Railway выложит сам.

Текущая копия: скачана 21.09.2026, `Last-Modified: Tue, 14 Jul 2026 09:31:36 GMT`, 116 510 байт,
SHA-256 `3549138a7934039fe7dfd1291a4ee739bd2b705a614308053a8b08a87d85c451`.
