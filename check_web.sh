#!/bin/bash

# Конфигурация
PORT=80
WEB_ROOT="/var/www/html"
INDEX_FILE="index.html"

# Функция логирования
log() {
    echo "$(date): $1" >> /var/log/keepalived-check.log
}

# Проверка 1: слушает ли порт?
if ! ss -tln | grep -q ":$PORT "; then
    log "ERROR: Port $PORT is not listening"
    exit 1
fi

# Проверка 2: существует ли index.html?
if [ ! -f "$WEB_ROOT/$INDEX_FILE" ]; then
    log "ERROR: $WEB_ROOT/$INDEX_FILE not found"
    exit 1
fi

# Всё хорошо
log "OK: Web server is healthy"
exit 0

