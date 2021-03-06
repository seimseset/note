# Ansible

## 关于 ansible.cfg

> ansible 无法在使用 ansible/ansible-playbook 时显示指定配置文件
> ansible 默认按以下路径一次寻找配置文件
> 使用 pip 安装 ansible 不会配置 ansible.cfg 可以从 [GitHub](https://github.com/ansible/ansible/blob/devel/examples/ansible.cfg) 获取

1. 环境变量 ANSIBLE_CONFIG 指定的文件
2. 当前目录下的 ansible.cfg 文件
3. $HOME 目录下的 ansible.cfg 文件
4. /etc/ansible/ 目录下的 ansible.cfg 文件

### 常用配置

> yum install cowsay

```shell
# 取消 host_key check
host_key_checking = False
```

## 模板

> 在模板文件中可以使用 jin2 的循环与条件语句，但是在 playbook 中不可以

- 如果语句以 {{ var }} 开始，则需要给 {{ var }} 加上双引号, 如 "{{ var }}"

## inventory

> inventory 常用变量
> 指定密码可以使用 ansible_password 或 ansible_ssh_pass 但是不能用 ansible_pass
> 使用 ansible 成功连接到目标主机后， ansible 会将连接信息缓存至 ~/.ansible 目录下(这样，inventory 不指定密码时也可以使用 ansible 连接)
> 缓存会保存多久暂时还不知道
> 以下变量名可在 playbook 以及 模板文件中直接调用, inventory_hostname 为主机名, 没定义默认为主机 IP
Name                       | Default         | Description
:--                        | :---            | :--
ansible_host               | Name            | of host Hostname or IP address to SSH to
ansible_port               | 22              | Port to SSH to
ansible_user               | Root            | User to SSH
asansible_password         | (None)          | Password to use for SSH authentication
ansible_connection         | smart           | How Ansible will connect to host (see the following section)
ansible_private_key_file   | (None)          | SSH private key to use for SSH authentication
ansible_shell_type         | sh              | Shell to use for commands (see the following section)
ansible_python_interpreter | /usr/bin/python | Python interpreter on host (see the following section)

```shell
# 在模板文件以及 play-book 中获取 inventory 的信息

```

## 关于 ad-hoc

> 建议使用 shell 而不是默认的 command 模块
> -a 选项后为 module 的参数，如果参数带有空格需要用引号括起来，建议使用单引号而不是双引号

## 常见需求

### 变量

- playbook 中 shell 参数使用变量
- playbook 中参数使用 $() 为变量
- 字符串嵌套引号

```shell
# static vars
'ansible_version'
'ansible_play_hosts'
'ansible_dependent_role_names'
'ansible_play_role_names'
'ansible_role_names'
'inventory_hostname'
'inventory_hostname_short'
'inventory_file'
'inventory_dir'
'groups'
'group_names'  # 获取包含该主机的组
'omit'
'playbook_dir'
'play_hosts'
'role_names'
'ungrouped'
'hostvars' # 可以获取所有主机的主机变量(常用于获取其它主机的变量)
```

### 获取主机的 ip 地址

```shell
# 1. 通过 hostvars 获取
{{ ansible_host }}

#2. 通过 facts 获取
{{ ansible_default_ipv4.address }}
```

## Handler

> task 的状态为 changed 时才会触发 handler
> Handlers usually run after all of the tasks are run at the end of the play.
> They run only once even if they are notified multiple times.

### handler 的两个常用的场景

1. 所有任务完成后，重启应用/重启计算机
2. 调试 play 时，错误触发结束 play

## 调试

```yaml
# play-books 调试 变量
- debug: var=var_name

# 打印调试信息
- debug: msg="${msg}"
```
