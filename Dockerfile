# 使用官方的nginx基础镜像
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/nginx_optimized

# 设置工作目录
WORKDIR /usr/share/nginx/html

COPY static.conf /etc/nginx/default.d/

COPY ./build/ /usr/share/nginx/html/
# 暴露80端口和443端口（如果你使用HTTPS）
EXPOSE 80 443

# 使用自定义entrypoint启动
CMD ["nginx", "-g", "daemon off;"]
