## wvp-docker部署方案

### 项目介绍

wvp-docker是基于[wvp-GB28181-pro](https://github.com/648540858/wvp-GB28181-pro)实现的一个Docker部署方案，旨在通过容器化部署方式，简化相关服务的搭建、配置和管理流程，实现项目快速部署。国内仓库目前托管在[cnb](https://cnb.cool/polaris-tian/wvp-docker)


### 项目结构

项目包含以下主要目录和文件，各自承担不同功能。

- `.ide`: [cnb](cnb.cool)云开发环境配置
- `media`: [夏楚 ZLMediaKit](https://github.com/ZLMediaKit/ZLMediaKit)流媒体服务
- `mysql`: wvp平台的数据库配置，当前最新版使用的是`2.7.4`版本数据库
- `nginx`: 相比较wvp一体化部署方案，本部署方案采用的前后端分离部署方式
- `wvp`: wvp-GB28181-pro的docker镜像构建
- `.cnb.yml`: cnb平台云开发与云构建配置
- `docker-build.sh`: Docker镜像构建脚本，用于自动化构建项目所需的Docker镜像
- `docker-compose.yml`: 生产环境的Docker Compose配置文件
- `docker-upgrade.sh`: Docker容器升级、部署脚本
- `push.sh`: 用于镜像推送的脚本

### 项目特点

1. 容器化部署: 基于 Docker 和 Docker Compose 实现所有服务组件的容器化部署，降低环境依赖冲突，简化部署流程。
2. 开发优化: 使用腾讯cnb云开发环境，使项目在云环境下的开发与运行更加顺畅；同时优化了镜像构建方式，提高构建效率。
3. 前后端分离部署
4. 便捷的脚本工具
5. 支持`AMD64`、`ARM64`架构

### 使用说明

#### 构建镜像

通过执行`docker-build.sh`脚本进行Docker镜像的构建：

```bash
chmod +x ./docker-build.sh && ./docker-build.sh
```

#### 修改HOST IP

替换掉全部的`172.x.x.x`的IP地址为部署机器的物理机IP地址，然后使用`docker-compose.yml`启动服务:

```bash
docker compose up
```

当需要后台运行服务时，执行`docker-upgrade.sh`脚本

```bash
./docker-upgrade.sh
```

#### 推送镜像

根据实际需求，通过`push.sh`推送构建好的镜像

```bash
./push.sh
```

### 注意事项

- 运行服务前确保修改配置中出现的IP为实际IP地址
- 执行脚本时，请注意权限问题，必要时添加执行权限(chmod+x 脚本名称)
- 根据实际部署需求，进行自定义调整

### 打个广告

![](https://docs.cnb.cool/images/logo/Horizontal/Horizontal-Color-CN.png)