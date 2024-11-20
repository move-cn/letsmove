---
title: sui-move基础（二）：letsmove-task1
date: 2024-11-09 17:52:55
tags:
---

# sui-move基础（二）：letsmove-task1

<img src="2ef34b8fa6311daf0a5c08e41137fda.jpg" alt="image-20241109180430695" style="zoom: 25%;" />

<div style="text-align: center;">
    <span style="font-size: smaller;">
        这是sui姬
    </span>
</div>


上一篇教程已经完成了sui-move环境的配置，从本节开始，将进行sui-move社区的letsmove系列task学习。

看到这里的你如果还不知道letsmove，而想要学习sui-move的话，可以进一步了解：https://github.com/move-cn/letsmove。

完成task有相应的sui代币奖励。

### fork并克隆仓库

鉴于本教程为初学者准备，这里首先介绍一下如何创建ssh秘钥：

​		**创建ssh key，用于ssh方式克隆github代码**。在linux环境下，使用`ssh-keygen -t rsa -b 4096 -C "你的邮箱"`命令，创建ssh key，下面的选项全部直接敲回车即可。 随后使用` cat ~/.ssh/id_rsa.pub` 命令查看生成的公钥，并完整的复制下来。 在github仓库界面点击自己的头像，选择`settings`。进入到设置页面后，点击左侧的`SSH and GPG keys`选项。点击`New SSH key`选项，并将复制下来的内容粘贴上去，添加该ssh key的描述。随后点击`Add SSH key`，并一路点击确认即可。

以上教程来自opencamp(https://opencamp.cn/)

适用于linux系统。

fork仓库：

进入https://github.com/move-cn/letsmove仓库，点击fork，一路确认即可。

克隆仓库：

进入自己fork下来的仓库，点击绿色的 `code` 按钮，选择ssh,复制下面框中的地址。

随后来到自己的本地环境，选择一个合适的路径，运行：

```bash
git clone git@github.com:你的github id/letsmove.git
```

如果出现网络问题，请更换节点或魔法开全局或退出魔法。

### hello_move

现在进入刚刚克隆的letsmove目录，应该有如下内容：

```powershell
(base) amyseer@universe:~/sui/letsmove$ ls
README.md  learning_map.md  mover  task  tutorial
```

进入task目录，**仔细阅读其中的readme.md**，我这里不再过多赘述。

在重命名001目录后，进入该目录，`cd co-learn-2411` （这里可能有区别），` cd project` ，在该路径下运行：

``` bash
sui move new hello_move
```

到这里，建议直接阅读官方文档：https://move.sui-book.com/your-first-move/hello-world.html

截止到目前，建议起码读完直到 `你好 sui!` 这一章，如果没有编程基础，可能会多花些时间。