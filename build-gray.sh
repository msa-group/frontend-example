echo "export default 'gray';" > ./src/version.ts
./build.sh gray
docker build --platform linux/amd64 \
-t registry.cn-hangzhou.aliyuncs.com/oss-share/msa:fe-gray \
--push \
-f Dockerfile .
echo "export default '';" > ./src/version.ts
