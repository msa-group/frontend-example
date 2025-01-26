# 第一阶段：使用Node.js进行应用构建
FROM node:16 AS builder

# 允许通过构建参数动态注入BASE_DIR（默认值为base）
ARG BASE_DIR=base
ENV BUILD_VERSION=$BASE_DIR

WORKDIR /app

# 安装依赖（利用层缓存优化）
COPY package*.json ./
RUN npm install

# 复制源代码并注入版本信息
COPY . .
RUN echo "export default '${BASE_DIR}';" > ./src/version.ts

# 执行构建并重组输出目录结构
RUN npm run build && \
    mkdir -p "./build/${BASE_DIR}" && \
    mv ./build/{js,css} "./build/${BASE_DIR}/"

# 第二阶段：使用优化后的Nginx镜像
FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/nginx_optimized

# 安装必要的系统工具
RUN yum install -y gettext

# 配置工作目录
WORKDIR /usr/share/nginx/html

# 从构建阶段复制产物
COPY --from=builder /app/build/ ./

# 复制Nginx配置模板和入口脚本
COPY static.conf.template /etc/nginx/default.d/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 声明容器接口
EXPOSE 80 443

# 配置容器入口点
ENTRYPOINT ["/entrypoint.sh"]
