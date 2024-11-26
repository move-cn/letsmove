# 速学150个Linux常用命令 - 学习笔记

## 基础知识介绍

### 获取Linux环境的几种常见方式
- **VMware虚拟机安装Linux操作系统**：适合本地测试和开发，提供模拟的Linux环境。
- **终端工具MobaXterm的使用**：一体化的终端工具，支持多种协议（SSH、SFTP等），便于远程连接Linux系统。
- **文件传输工具WinSCP的使用**：图形化的文件传输工具，适用于Windows和Linux系统之间的文件传输。

### Linux目录结构介绍
- 根目录 `/`：系统根目录，所有文件和目录的起始点。
- `/bin`：基本二进制可执行文件，如常用命令`ls`、`cat`等。
- `/etc`：系统配置文件目录。
- `/home`：普通用户的主目录。
- `/var`：日志文件和动态数据文件存放的目录。
- `/tmp`：临时文件目录。
- `/usr`：包含用户应用程序和文件。

### Linux系统文件或目录颜色的含义
- **蓝色**：目录
- **绿色**：可执行文件
- **红色**：压缩文件
- **浅蓝色**：链接文件
- **黄色**：设备文件

### Linux系统常用终端快捷键
- **Ctrl + C**：终止当前命令执行。
- **Ctrl + Z**：将当前命令放入后台并暂停（使用`fg`恢复）。
- **Ctrl + D**：退出终端或结束输入。
- **Ctrl + L**：清屏，相当于`clear`命令。
- **Ctrl + A**：将光标移动到行首。
- **Ctrl + E**：将光标移动到行尾。
- **Ctrl + U**：删除光标前的所有内容。
- **Ctrl + K**：删除光标后的所有内容。
- **Ctrl + W**：删除光标前的一个单词。
- **Ctrl + Y**：粘贴（恢复最后一次被删除的文本）。
- **Ctrl + R**：反向搜索历史命令。
- **Ctrl + P**：显示上一条历史命令。
- **Ctrl + N**：显示下一条历史命令。
- **Alt + .**：粘贴上一个命令的最后一个参数。
- **Tab**：自动补全命令、文件或目录名。

- **Shift + PgUp**：向上滚动终端内容。
- **Shift + PgDn**：向下滚动终端内容。
- **!!**：执行上一条命令。
- **!n**：执行历史记录中第`n`条命令（使用`history`查看编号）。

### Tab键的妙用
在 Linux 终端中，**Tab 键**有以下几个常用的用途：

1. **命令或文件名自动补全**：
- 输入命令或文件名的开头部分后，按 `Tab` 键，系统会自动补全（如果该部分是唯一的）。
- 如果有多个可能的补全项，按两次 `Tab`，系统会列出所有匹配项供选择。

示例：
```bash
# 输入 "cd Do" 后按 Tab，系统会自动补全目录名 "Documents"（如果唯一）
cd Do<Tab>  # 自动补全为 "cd Documents"
```
2. 路径补全：
- 在输入文件或目录路径时，Tab 键会尝试自动补全路径。
- 若路径中有多层嵌套目录，Tab 可以逐层补全。
```bash
# 输入 "cd /ho" 后按 Tab，系统会补全为 "/home"。
cd /ho<Tab>  # 自动补全为 "cd /home"
```
3.	查看命令选项（部分命令支持）：
- 输入部分命令名后按 Tab，可能会显示该命令的所有选项。
示例：
```bash
# 输入 "git " 后按两次 Tab，系统会列出所有 Git 命令。
git <Tab><Tab>
```
这些快捷功能可以大大提高命令行操作的效率，减少输入错误。

### 文件权限介绍

在 Linux 系统中，文件权限用于控制谁可以访问或操作文件。权限分为 **读取 (r)**、**写入 (w)** 和 **执行 (x)** 三种，每一种权限适用于不同的用户角色。掌握文件权限的管理方式是确保系统安全性和资源合理访问的重要组成部分。

#### 文件权限类型
- **读取 (r)**：允许查看文件内容或列出目录内容。
- **写入 (w)**：允许修改文件内容、创建或删除文件、修改目录内容等。
- **执行 (x)**：允许运行文件（对于可执行文件）或进入目录。

#### 用户分类
权限可以为不同类别的用户设置：
- **所有者 (u)**：通常是文件的创建者，可以对其设置完全的读、写、执行权限。
- **同组用户 (g)**：与所有者同属一个用户组的用户，可以根据权限设定对文件进行访问和操作。
- **其他用户 (o)**：系统中其他非该文件所有者及其组的用户，权限一般更为严格，通常只允许最低限度的访问权限。

#### 权限表示方式
文件权限可以通过字符或数字形式表示。

1. **字符形式**：
- 文件权限通常用 10 个字符表示，第一个字符表示文件类型，`-` 表示普通文件，`d` 表示目录，`l` 表示链接文件。
- 后续 9 个字符分成三组，每组 3 个字符，依次表示所有者、同组用户、其他用户的权限。每组中 `r` 表示读取，`w` 表示写入，`x` 表示执行。

示例：
```bash
drwxr-xr-x
```
- `d` 表示目录。
- `rwx` 表示所有者拥有读、写、执行权限。
- `r-x` 表示同组用户拥有读、执行权限。
- `r-x` 表示其他用户拥有读、执行权限。

2. **数字形式**：
- 权限也可以通过八进制数字表示，其中 `r=4`、`w=2`、`x=1`。将数字相加得到相应的权限组合。
- 每个用户角色拥有一个三位数字，表示所有者、同组用户和其他用户的权限。

示例：
- `755`：所有者拥有读、写、执行权限 (`rwx = 4+2+1 = 7`)，同组用户和其他用户拥有读、执行权限 (`r-x = 4+0+1 = 5`)。
- `644`：所有者拥有读、写权限 (`rw- = 4+2+0 = 6`)，同组用户和其他用户拥有读取权限 (`r-- = 4+0+0 = 4`)。

#### 修改权限的命令
在 Linux 中，使用 `chmod` 命令可以修改文件或目录的权限。

- **数字形式设置权限**：
```bash
chmod 755 filename   # 设置文件为所有者 rwx，同组和其他用户 r-x
chmod 644 filename   # 设置文件为所有者 rw，同组和其他用户 r
```
- **字符形式设置权限**：
    - u 表示所有者，g 表示同组用户，o 表示其他用户，a 表示全部用户。
    - +添加权限，- 移除权限，= 指定权限。
    ```bash
    chmod u+x filename     # 给所有者添加执行权限
    chmod g-w filename     # 移除同组用户的写权限
    chmod o=r filename     # 将其他用户权限设置为只读
    ```
### 通配符介绍
- `*`：匹配任意字符。
- `?`：匹配单个字符。
- `[abc]`：匹配其中一个字符。
- `[a-z]`：匹配字符范围。

---

## 常用命令用法及说明

### 帮助命令
- **man**：显示命令的手册页，如`man ls`。
- **info**：显示命令的GNU info文档，如`info ls`。
- **whatis**：显示命令的简短描述，如`whatis ls`。

### 文件和目录操作
- **touch**：创建空文件或修改文件的时间戳，如`touch newfile.txt`。
- **mkdir**：创建目录，如`mkdir newdir`。
- **rm**：删除文件或目录，如`rm file.txt`，`rm -r dir`。
- **rmdir**：删除空目录，如`rmdir emptydir`。
- **mv**：移动或重命名文件或目录，如`mv oldname newname`，`mv file.txt /newdir/`。
- **cp**：复制文件或目录，如`cp file.txt /newdir/`，`cp -r dir /newdir/`。
- **cd**：切换目录，如`cd /newdir`。
- **pwd**：显示当前工作目录。
- **ls**：列出目录内容，如`ls -l`显示详细信息。
- **tree**：以树状结构显示目录内容，如`tree`。
- **stat**：显示文件或文件系统的状态信息，如`stat file.txt`。
- **rename**：批量重命名文件，如`rename 's/old/new/' *.txt`。
- **basename**：从完整路径中提取文件名，如`basename /path/to/file.txt`。
- **dirname**：从完整路径中提取目录部分，如`dirname /path/to/file.txt`。
- **chattr/lsattr**：修改/查看文件属性，如`chattr +i file.txt`，`lsattr file.txt`。
- **file**：识别文件类型，如`file file.txt`。
- **md5sum**：生成和校验文件的md5值，如`md5sum file.txt`。

### 查找命令
- **find**：查找目录或文件，如`find / -name file.txt`。
- **which**：查找命令的位置，如`which ls`。
- **whereis**：查找命令、源代码和手册页的位置，如`whereis ls`。
- **locate**：查找符合条件的文档，如`locate file.txt`（需先运行`updatedb`更新数据库）。

### 文件权限和用户管理
- **chown**：改变文件所属用户或组，如`chown user:group file.txt`。
- **chgrp**：改变文件或目录所属组，如`chgrp group file.txt`。
- **chmod**：改变用户对文件或目录的权限，如`chmod u+x file.txt`，`chmod 755 file.txt`。

### 文本处理
- **grep**：文本搜索工具，如`grep 'pattern' file.txt`。
- **egrep**：文件内查找指定字符串命令（同`grep -E`），如`egrep 'pattern' file.txt`。
- **cat**：查看文本内容，如`cat file.txt`。
- **more**：逐页阅读文本，如`more file.txt`。
- **less**：分页查看文本内容，如`less file.txt`。
- **head**：查看文件开头内容，如`head -n 10 file.txt`。
- **tail**：查看文本尾部内容，如`tail -n 10 file.txt`。
- **tac**：反向显示文本内容，如`tac file.txt`。
- **nl**：统计文件行号，如`nl file.txt`。
- **wc**：统计文本字数信息，如`wc -l file.txt`。
- **split**：文件切割，如`split -l 100 file.txt part_`。
- **cut**：文本截取，如`cut -d: -f1 /etc/passwd`。
- **paste**：文件合并，如`paste file1.txt file2.txt`。
- **sort**：文本内容排序，如`sort file.txt`。
- **uniq**：去除重复行，如`uniq file.txt`。
- **diff/patch**：比较差异/打补丁，如`diff file1.txt file2.txt`，`patch file1.txt < patchfile`。
- **join**：连接两个文件，如`join file1.txt file2.txt`。
- **tr**：字符转换，如`tr 'a-z' 'A-Z' < file.txt`。
- **sed**：流编辑器，如`sed 's/old/new/' file.txt`。
- **awk**：编程语言，用于文本处理，如`awk '{print $1}' file.txt`。

### 系统监控和管理
- **du**：显示目录或文件大小，如`du -sh /dir`。
- **df**：磁盘使用情况，如`df -h`。
- **sync**：数据同步，如`sync`。
- **mount/umount**：挂载/卸载文件系统，如`mount /dev/sda1 /mnt`，`umount /mnt`。
- **dd**：拷备及转换文件，如`dd if=/dev/zero of=file.txt bs=1M count=1`。
- **tar**：打包解压文件，如`tar -czvf archive.tar.gz /dir`，`tar -xzvf archive.tar.gz`。
- **zip/unzip**：压缩/解压文件，如`zip archive.zip file.txt`，`unzip archive.zip`。
- **gzip/gunzip**：压缩/解压文件，如`gzip file.txt`，`gunzip file.txt.gz`。
- **uname**：显示系统信息，如`uname -a`。
- **hostname**：显示或设置主机名，如`hostname`，`hostname newhostname`。
- **dmesg**：显示开机信息，如`dmesg | less`。
- **uptime**：查看系统负载，如`uptime`。
- **free**：显示内存使用情况，如`free -h`。
- **ulimit**：限制系统资源，如`ulimit -n 2048`。
- **init**：切换系统运行级别，如`init 3`。
- **service**：控制系统服务，如`service httpd start`。
- **vmstat**：显示虚拟内存状态，如`vmstat 1`（每秒更新一次）。
- **iostat**：监视系统输入输出设备和CPU的使用情况，如`iostat -x 1`（详细模式，每秒更新一次）。
- **ipcs**：显示进程间通信设备状态，如`ipcs -a`（显示所有IPC信息）。
- **ipcrm**：删除指定ipc资源，如`ipcrm -m shm_id`（删除消息队列）。
- **route**：显示并设置IP路由表，如`route -n`（以数字形式显示路由表）。

### 网络工具

- **ping**：网络连通测试命令，如`ping www.example.com`。
- **traceroute**：追踪数据包传输路径命令，如`traceroute www.example.com`。
- **ifconfig**：显示或设置网络设备参数命令，如`ifconfig eth0 192.168.1.10`（设置IP地址）。
- **ifup_ifdown**：激活或禁用网络接口命令，如`ifup eth0`，`ifdown eth0`。
- **netstat**：查看网络相关信息命令，如`netstat -tuln`（显示监听中的TCP和UDP端口）。
- **ss**：显示活动套接字信息命令，如`ss -tuln`（与netstat类似，但更快）。
- **telnet**：远程登陆服务器命令，如`telnet host port`。
- **ssh**：安全连接服务器命令，如`ssh user@host`。
- **ftp**：文件传输命令，如`ftp ftp.example.com`。
- **sftp**：交互式文件传输程序，如`sftp user@host`。
- **lftp**：下载工具，支持多种协议，如`lftp ftp://ftp.example.com`。
- **wget**：网络下载工具，如`wget http://example.com/file.zip`。
- **scp**：远程文件拷贝命令，如`scp user@remote:/path/to/file /local/path`。
- **curl**：远程数据传输工具，支持多种协议，如`curl -O http://example.com/file.zip`。
- **host**：分析域名查询工具，如`host www.example.com`。
- **tcpdump**：数据抓包工具，如`tcpdump -i eth0 port 80`（抓取80端口的数据包）。
- **nc**：网络检测工具，如`nc -zv host port`（扫描端口）。

### 用户和组管理

- **useradd**：创建用户命令，如`useradd username`。
- **adduser**：用户相关命令（某些Linux发行版中useradd的别名）。
- **passwd**：修改用户密码命令，如`passwd username`。
- **userdel**：删除用户命令，如`userdel username`。
- **su**：切换用户命令，如`su - username`。
- **sudo**：以其他身份来执行命令，如`sudo command`。
- **id**：显示用户id信息命令，如`id username`。
- **usermod**：修改用户信息命令，如`usermod -aG groupname username`（添加用户到组）。
- **groups**：显示用户所属的组。
- **groupadd**：用户组相关命令，用于创建新组，如`groupadd groupname`。
- **groupdel**：用户组相关命令，用于删除组，如`groupdel groupname`。

### 用户信息

- **whoami**：显示当前用户名。
- **who**：显示当前登录的用户信息。
- **w**：显示当前登录用户及其活动。
- **last**：显示最近登录的用户信息。
- **users**：显示当前登录的用户列表。

### 进程管理

- **top**：实时显示系统进程信息。
- **ps**：进程管理命令，如`ps aux`（显示所有进程）。
- **pstree**：以树状图显示进程信息。
- **pgrep**：查找与指定条件匹配的进程ID。
- **lsof**：列出打开的文件（包括网络套接字），如`lsof -i :80`（列出使用80端口的进程）。
- **jobs_bg_fg**：管理后台作业（bg将作业放入后台，fg将作业调回前台）。
- **kill**：终止进程，如`kill pid`。
- **killall**：根据进程名终止所有匹配的进程。
- **nice_renice**：调整进程的优先级，如`nice -n 10 command`（以低优先级运行命令），`renice 5 -p pid`（调整已运行进程的优先级）。
- **nohup**：使进程在用户注销后继续运行，如`nohup command &`。

### 包管理

- **apt**：Debian及其衍生版（如Ubuntu）的包管理器，如`apt update`，`apt install package`。
- **apt-get**：apt的旧版本命令，功能类似。

### 环境变量和终端操作

- **export**：设置或显示环境变量，如`export VAR_NAME=value`。
- **source**：读取并执行指定文件中的命令，如`source ~/.bashrc`。
- **set_unset**：设置或取消环境变量（set用于显示和设置环境变量，unset用于取消环境变量）。
- **echo**：输出字符串或变量的值到终端。
- **printf**：格式化输出字符串到终端。
- **clear**：清除终端屏幕。
- **history**：显示命令历史记录。
- **login_logout**：登录和注销命令（login用于登录，logout用于注销）。
- **exit**：退出当前shell或终端会话。

### 命令相关

- **xargs**：构建并执行命令行，如`echo "file1 file2" | xargs cat`。
- **exec**：用指定命令替换当前shell进程，如`exec ls`。
- **alias_unalias**：设置或取消命令别名，如`alias ll='ls -l'`，`unalias ll`。
- **type**：显示命令的类型（如内置命令、外部命令等）。

### 时间相关

- **date**：显示或设置系统日期和时间，如`date`，`date -s "2023-04-01 12:00:00"`。
- **cal**：显示日历，如`cal 2023`。
- **crontab**：编辑用户的cron作业表，用于定时执行任务。
- **at_atq_atrm**：at命令用于在指定时间执行一次性任务，atq显示待执行的任务，atrm删除已安排的任务。
- **time**：测量命令的执行时间，如`time ls`。
- **watch**：周期性地执行命令并全屏显示结果，如`watch -n 2 ls`（每2秒执行一次ls）。

### 小工具

- **bc**：任意精度计算器语言，如`echo "scale=2; 3/1" | bc`（计算3除以1并保留两位小数）。
- **ln**：创建硬链接或符号链接，如`ln file link`（创建硬链接），`ln -s file symlink`（创建符号链接）。
- **shutdown_halt_poweroff_reboot**：系统关机、停机、断电或重启命令，如`shutdown -h now`（立即关机），`halt`（停机，某些系统中已弃用），`poweroff`（断电），`reboot`（重启）。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)