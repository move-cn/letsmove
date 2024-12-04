> 注意 : 这篇文章是水分子HOH社区举办的move共学营中提交作业的方法
>



项目地址 : [https://github.com/move-cn/letsmove/](https://github.com/move-cn/letsmove/)





# 第一步 : fork 项目
> fork项目就是将官方的仓库同步一份到自己github上,但需要注意的是这个同步不是实时同步,每次自己拉取代码之前需要手动同步一下
>

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995407766-20e9b2b9-3993-4c8e-9a33-70a56d274d39.png)





create fork

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995446504-68190cad-77bb-4821-8b35-cfbfa59e5b6f.png)

# 第二步 : 将项目克隆到本地
在工作目录clone项目(我这里配置过ssh了,没有配置过的话需要自己配置一下)

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1730995598525-c623cc0d-70b9-44f1-b4e8-2927c55770e0.png)

```shell
git clone git@github.com:antgeekmusk/letsmove.git
```



# 第三步 : 开始编写第一个任务
用RustRover打开后,先从main分支拉取一个task1分支,之后可以每个task就拉取一个分支,这样方便提pr,因为如果你不拉分支的话,pr的链接一直都会是一个,正常的开源共享都是修改一个小问题就会拉一个分支,然后提交上去,也方便合并



![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1731048555345-9a2a561f-1783-4d72-a0a6-b68708a8c154.png)



复制mover/001 目录 将001改成自己的githubid ,这一步是为了每个人提交的时候不会乱,每个人都改自己的文件,同时可以创建一个images文件夹来存储图片,如下图是我的



![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1731048647552-60e6e3b5-752d-40f1-9020-ecbbbeac8959.png)



剩下的就是安装根目录下的readme文件进行操作即可,具体可以看哔哩哔哩视频

链接如下 : 

[https://www.bilibili.com/video/BV1zTD8Y7EFB](https://www.bilibili.com/video/BV1zTD8Y7EFB)



不知道格式如何的可以参考已经github合并的代码,多看几个



# 第四步 : 提交pr
```shell
git commit -m "[task1] task1 and some other task"
git push
```



在页面点击 Contribute

![](https://cdn.nlark.com/yuque/0/2024/png/22215394/1731049200180-64c3e8c4-841c-4f23-ab8b-b5cab94e1a31.png)





完事儿~ 

等待merge

