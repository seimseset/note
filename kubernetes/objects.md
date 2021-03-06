# Kubernetes 对象属性

> API 对象是 Kubernetes 集群中的管理操作单元.
> 每个 API 对象都有三大类属性 : metadata(元数据) spec(描述/规范) status(状态).

## Metadata

> namespace, name, uid 是每个 API 对象都必须有的元数据

### namespace

对象所在的名称空间

### name

对象的名字（集群中的唯一标识）

### uid

对象的唯一标识

### label

打在对象上的标签，用来给对象分类

```shell
# 查看标签
kubectl get po --show-labels

# 设置标签(标签不存在)
kubectl label po ${key}=${val}

# 修改标签(标签已存在)
kubectl label po ${kye}=${val} --over-write

# 标签匹配(相等型匹配`=;!=`, 逗号为 `&` 的作用)
kubectl get po -l ${k1}=${v1},${k2}!=${v2} #逗号前后不能有空格

# 标签匹配(集合型匹配 `in;not in`)
kubectl get po -l '${key} in (${v1}, ${v2})'

```

### annotation

存储资源的非标识性信息

### ownerReferences

指向创建该对象的对象(如 rs 创建的 pod 中的 ownerReferences 中存储的是 rs 的部分元数据)

## Spec

> Spec 描述了用户期望该对象达到的状态

### containers

> spec 中的 containers 字段定义了要在 pod 中启动的容器

- readinessProbe
  > 就绪探针：定义了容器就绪状态的标准

- livenessProbe
  > 存活探针：定义了容器存货状态的标准

## Status

> Status 描述了该对象现在的状态

### Pod Status

- phase(阶段): 描述了 Pod 处于生命周期的哪个状态
  1. Pending(等待): Pod 已被 Kubernetes 接受，但是 Container 的创建还没完成
  2. Running(运行): Pod 已经被绑定到 node 节点上, 所有 Container 已经创建完毕，至少有一个 Container 在运行/启动/重启
  3. Succeeded(达到目的的): 所有 Container 已经成功终止，不会重启
  4. Failed(失败的): 所有 Container 已终止，至少有一个非正常终止
  5. Unknow(不可知的): 无法获取 Pod 的状态，通常是与 Pod 通信时出错导致的

- condition(健康状态)
  > type 有以下五种取值，每个 type 都有一个 status=ture/false,表示是否达到改状态
  1. type=Initialized: Pod 中所有容器已经初始化完成
  2. type=Ready: Pod 已经做好工作准备
  3. type=PodUpdateVersion: Pod 更新了版本
  4. type=PodScheduled: Pod 已被调度到另一节点
  5. type=Unscheduled: Pod 无法被调度

#### Running 过程中可能出现的状态

1. Wating
2. ContainerCreating
3. ImagePullBackOff
4. CrashLoopBackOff : 容器曾经启动过但是又异常退出了
5. Error : 启动过程中发生了异常
6. Terminating
