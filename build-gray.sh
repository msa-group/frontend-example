docker build --platform linux/amd64 \
  --build-arg BASE_DIR=gray \
  -t registry.cn-hangzhou.aliyuncs.com/oss-share/msa:fe-gray \
  --push . \
  -f Dockerfile
