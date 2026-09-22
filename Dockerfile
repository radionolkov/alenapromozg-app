FROM nginx:alpine
# Корневые сертификаты — для проверки сертификата n8n при пересылке вебхуков (nginx.conf).
RUN apk add --no-cache ca-certificates
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html telegram-web-app.js /usr/share/nginx/html/
EXPOSE 80
