docker build --platform linux/amd64 \
  --build-arg BASE_DIR=base \
  -t registry.cn-hangzhou.aliyuncs.com/oss-share/msa:fe-base \
  --push . \
  -f Dockerfile
