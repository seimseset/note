# 网络层

## IP实现网络互联机制

- 网络互连的关键是IP，IP核心内容是IP地址和IP分组
- 节点根据IP分组目的IP地址和路由表确定下一跳IP地址
- 由传输网络实现IP分组从当前跳到下一跳的传输过程
- IP分组经过不同的网络传输时，需封装成传输网络对应帧格式

## IP地址分类

> IP地址不是终端或路由器的标识符，而是终端或路由器接口的标识符
> 接口是指终端或路由器与网络之间的连接点，终端或路由器允许有多个接口
> 每一个接口都有一个独立的标识符 -- IP地址

- 分类方法
  1. 分层编址 网络号 + 主机号（网络号表示属于哪个网络/网段）

- 分类分层原因

- 配置原则

- 分类缺陷
  1. 浪费

### 无分类编制机制

> 通过子网掩码指明IP地址中作为网络号的二进制数
> 子网掩码中值为1的二进制数对应IP地址中作为网络号的二进制数

- CIDR（Classless Inter-Domain Routing: 无类别域间路由）地址块：x.x.x.x/x
  - CIDR分配给单个网络
    1. 主机号全0的IP地址为该网络的网络地址
    2. 主机号全一的IP地址为该网络的直接广播地址
    3. 网络前缀全0的IP地址作为主机地址
  - CIDR分配给多个网络

### MTU(Maximum Tansfer Unit)：链路层帧净荷字段允许的最大长度，以太网的MTU为1500B，即以太网MAC帧中IP分组长度不能超过1500B。所以如果IP分组大于该值时就要对该分组进行数据分片

### IP分组

- IP首部
  1. 版本(4位)：IPv4：0100
  2. 首部长度（4位）：以字节为单位，最小长度为5字节
  3. 服务类型（8位：优先级3位 D T R 两位保留位）
     > 允许终端给网络提出提供服务的要求，如IP分组的优先级、延迟、吞吐率以及可靠性等，优先级范围为0~7，优先级越高就有限提供服务。 D：延时要求  T：吞吐率要求  R：可靠性
  4. 总长度（16位）：首部+数据的总长度。最大为65535字节
  5. 标识（16位）：数据分片时，属于同于个数据片的标识值相同。便于重新组合
  6. 标志（3位）：三位分别表示 DF MF 最后一位保留。若DF=1则IP分组不使用分片，MF为0表示为分片的最后一片。
  7. 片偏移（13位）：表示数据片在原IP分组中的相对位置，单位为8字节
  8. 生存时间（8位）：限制分组在网络中存在时间的计数器。目前该字段的值表示为最大跳。每经过一跳就减一。为0时丢弃分组
  9. 协议（8位）：上层使用的协议类型
  10. 首部检验和（16位）：对首部使用检验和计算出检错码，用于检验首部传输过程中是否发生错误
  11. 源IP地址
  12. 目的IP地址
  > IP分组固定部分用于保证IP分组端到端正确传输所需要的控制信息
  > 可选部分用于研究及特殊的用途
  > 由于可选部分有很强的侦察网络拓扑结构的能力，一般的路由器都屏蔽这些选项

- 数据分片

## IP 分组传输过程

> 将 s_ip 和 d_ip 分别与各自的子网掩码做 & 操作，获取两个 ip 所属的网络是否为同一个网络，如果是同一个网络，直接转发
> 如果两个 ip 不在同一个网络，先将 ip 报文放送至 s_ip 的默认网关，然后通过 d_ip 和路由表确定下一跳地址（下一跳地址的网络与 s_ip 的网络肯定是互联的，所以可以直接转发至下一跳地址。然后重复上述操作）

1. 建立IP传输路径
2. IP分组逐跳转发
   - 默认网关确定第一跳IP地址
   - 路由表和目的的终端IP地址确定下一跳IP地址
3. 通过IP over X 技术与 X 传输网络实现具体传输过程

## IP over以太网

- ARP协议  IP --> MAC
  ARP缓存会记录MAC 与 IP之间的对应关系
  > 终端A根据B的IP地址获取B的MAC地址过程
  1. 终端A广播ARP请求帧 包含 目的地址：全1广播地址 源地址：MAC_A 数据类型：ARP 数据：IP_A MAC_A IP_B 等
  2. 终端B接收到之后将MAC_B 添加至数据中，单播至终端A

- ICMP（Internet Control Message Portocol）
  1. 检测Internet的操作
  2. 报告IP分组传输过程中发生的意外情况
  3. 测试Internet的运行状态

  - 差错报告报文
  >向IP分组的发送端发送不同类型的差错报告报文
    1. 终点不可达
    2. 源站抑制
    3. 超时
    4. 参数问题
    5. 改变路由

  - 询问报文
  > 根据需要向一个特定的目的设备发出不同询问报文
  1. 回送请求和响应
  2. 时间戳请求和相应
  3. 地址掩码请求和响应
  4. 路由询问和通告