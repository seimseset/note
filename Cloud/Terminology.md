# Terminology

- CVM(Cloud Virtual Machine) 云主机（腾讯公有云服务）
- TCE(Tencent Cloud Enterprise) 腾讯专有云平台
- IDC(Internet Data Center) 因特网数据中心
- VPC(Virtual Private Cloud) 虚拟私有云（可自定义的网络空间）
- DCI(Data Center Inter-connect) DCI网络（用于数据中心之间的互联网络）
- TGW(Tencent GateWay) 一套实现多网统一接入、外网网络请求转发、支持自动负载均衡的系统
- BMS(Bare Metal Server) 裸金属服务器：虚拟机外表+物理机心脏
- SW(Switch) 交换机 用于局域网内不同主机互联（网关只识别MAC地址）
- GW(GateWay) 网关（网络互联） 用于不同局域网之间互联
- hypervisor 管理程序
- TKE(Tencent Kubernetes Engine) 腾讯云容器服务, 基于原生 kubernetes 的容器管理服务
- Tunneling 隧道
- IPSec(IP Security) IP安全协议(是一套协议包而不是某一个协议)
- LB(Load balancing) 负载均衡
- PXE(Preboot eXecution Environment) 预启动/执行环境
- LXC(Linux Container) 一种内核虚拟化技术
- NTP(NetWork Time Protocol) 网络时间协议
- ISCSI(Internet Small Computer System Interface)
- CBS(Cloud Block Storage) 云硬盘
- CDB(Cloud DataBase) 云数据库
- CLI(command-line interface) 命令行接口（界面）
- CI(Continuous Intergration) 持续集成(监控代码提交情况，对每个新的提交进行自动化测试)
- CD (Continuous Deployment) 持续部署(自动化的构建、测试和部署新的提交)
- CD(Continuous Delivery) 持续交付 CI/CD常用于敏捷开发
- Ceph 分布式文件系统
- Ceph RBD ( 块存储) 将裸磁盘空间映射给主机使用
- Ceph FS (文件存储) 架设FTP 或NFS服务 实现文件共享
- Ceph RGW (对象存储) 架设大容量磁盘的分布式服务器，速度快，文件可共享
- ETCD 高可用强一致性的Key/Value存储系统
- ZooKeeper 分布式系统协调服务。为分布式应用提供一致性服务
- IaaS(Infrastructure as a Service) 基础设施即服务
- PaaS(Platform as a Service) 平台即服务，为开发人员提供了应用开发和部署的环境
- SaaS(Software as a Service) 软件即服务
- CNI(Container NetWork Interface) 容器网络接口
- ES(ElasticSearch) 搜索引擎，分布式的实时文件存储，每个字段都被索引并可被搜索
- MQ(Message Queue) 消息队列
- Kafka 分布式消息系统
- LDAP(Lightweight Directory Access Protocol) 轻量目录访问协议
- HDFS(Hadoop Distributed File System) Hadoop 分布式文件系统(用于存储数据)
- CKV(Cloud KeyValue) 腾讯自主研发的高性能、低延时、持久化、分布式 KV（key-value）存储服务
- VStation 腾讯自研分布式调用系统
- TDSQL(Tencent Distribute MySQL) 腾讯分布式式金融数据库(Mysql版)
- ATM(Asynchronous Transfer Mode) 异步传输方式
- Ethernet 以太网
- DCOS(Data Center Operating System)：私有云的物理基础架构管理引擎
- 带外： 服务器(ILO Integrated Ligths-out)