#!/bin/bash

# ─── تنظیم نام دستگاه ───
DEVICE_NAME="${DEVICE_NAME:-HoneyGainR}"   # اگر متغیر محیطی تنظیم نشده باشد، مقدار پیش‌فرض
hostname "$DEVICE_NAME"
echo "Device name set to: $(hostname)"
# ─────────────────────────

echo "Starting Honeygain..."
/usr/local/bin/honeygain -email "$EMAIL" -pass "$PASSWORD" -accept-tos &

echo "Starting dummy web server on port 8080 (keeps container alive)..."
while true; do
    echo -e "HTTP/1.1 200 OK\r\n\r\nHoneygain is running on $(hostname)" | nc -l -p 8080 -q 1
done
