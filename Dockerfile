# تصویر پایه سبک
FROM alpine:latest

# نصب وابستگی‌ها
RUN apk add --no-cache wget bash coreutils

# دانلود Honeygain
RUN wget -q -O /usr/local/bin/honeygain \
    https://github.com/honeygain/honeygain-cli/releases/download/v0.1.2/honeygain-linux-amd64 \
    && chmod +x /usr/local/bin/honeygain

# تنظیم ایمیل و رمز عبور به صورت هاردکد (⚠️ امنیت پایین)
ENV EMAIL="rezanb110110@gmail.com"
ENV PASSWORD="Rez@1361"

# اسکریپت ورودی
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
