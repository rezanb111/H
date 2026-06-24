#!/bin/bash

echo "Starting Honeygain..."
/usr/local/bin/honeygain -email "$EMAIL" -pass "$PASSWORD" -accept-tos &

echo "Starting dummy web server on port 8080..."
while true; do
    echo -e "HTTP/1.1 200 OK\r\n\r\nHoneygain is running" | nc -l -p 8080 -q 1
done
