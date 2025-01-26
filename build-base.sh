echo "export default 'base';" > ./src/version.ts
./build.sh base
docker build --platform linux/amd64 \
-t registry.cn-hangzhou.aliyuncs.com/oss-share/msa:fe-base \
--push . \
-f Dockerfile
echo "export default '';" > ./src/version.ts