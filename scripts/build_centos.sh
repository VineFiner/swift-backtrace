#!/bin/sh

# 当前目录
echo $PWD

############## 构建可执行二进制文件 ##########
# 构建
docker run --rm \
-v "$PWD:/workspace" \
-w /workspace \
swift:5.6.2-centos7  \
/bin/bash -cl " \
          yum update -y \
          && yum remove git -y \
          && yum -y install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm \
          && yum install git -y \
          && swift package resolve \
          && swift build -c release --static-swift-stdlib"
