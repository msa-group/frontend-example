#!/bin/sh

# 根据环境变量设置Cookie头
if [ "$noAuth" = "true" ]; then
  export NO_AUTH_COOKIE_HEADER='add_header Set-Cookie "userid=00000001; Path=/;";'
else
  export NO_AUTH_COOKIE_HEADER=""
fi

# 使用envsubst替换模板中的变量
envsubst '${NO_AUTH_COOKIE_HEADER}' < /etc/nginx/default.d/static.conf.template > /etc/nginx/default.d/static.conf

# 启动Nginx
exec nginx -g "daemon off;"
