#!/bin/bash

# 传入的第一个参数将被当作 base 目录
BASE_DIR=$1

# 如果未传入 base 目录，则退出脚本
if [ -z "$BASE_DIR" ]; then
  echo "Error: No base directory supplied"
  exit 1
fi

# 运行 npm 构建命令
BUILD_VERSION=$BASE_DIR npm run build

# 创建 base 目录及其子目录
mkdir -p "./build/${BASE_DIR}/js"
mkdir -p "./build/${BASE_DIR}/css"

# 移动 js 和 css 文件夹到指定的 base 目录
mv -f ./build/js "./build/${BASE_DIR}/" || echo "Moving JS failed, directory might not exist."
mv -f ./build/css "./build/${BASE_DIR}/" || echo "Moving CSS failed, directory might not exist."
