# 使用官方的nginx基础镜像
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/nginx_optimized

# 安装envsubst工具
RUN yum install -y gettext

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 复制Nginx配置模板
COPY static.conf.template /etc/nginx/default.d/

# 复制入口脚本并设置权限
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 复制构建文件
COPY ./build/ /usr/share/nginx/html/

# 暴露端口
EXPOSE 80 443

# 使用自定义entrypoint启动
ENTRYPOINT ["/entrypoint.sh"]
