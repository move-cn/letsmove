一、贡献流程
1.先fork
获取https://github.com/test-summer-pursuit/python_designe

2.克隆到本地仓库
git clone https://github.com/test-summer-pursuit/python_designe

3.进入目录下创建分支
git checkout -b new_branch
查看当前分支
git branch

4.为仓库创建一个新的远程，该上游仓库是复刻的原始仓库
git remote add upstream https://github.com/summer-pursuit/python_designe

5.此时可以修改本地仓库的内容

6.提交文件到暂存区
git add . 提交所有文件
git add file1 file2 提交指定文件

7.由暂存区提交到仓库区
git commit -S -m "进行测试完成！话语"      

8.提交当前分支到远程仓库
git push -u origin new_branch

二、更新仓库
1.获取上游仓库的更新
git fetch upstream

2.切换分支，确定要更新到的本地仓库的分支
git checkout new_branch

3.合并上游仓库（复刻源），默认复刻源仓库分支为main
git merge upstream/main

4. 解决合并冲突（如果有）
如果在合并过程中出现合并冲突，Git 会提示您解决冲突。您需要手动编辑冲突的文件，解决冲突后，使用以下命令标记为已解决：
git add <conflicted_file>
然后，完成合并：
git commit

5.推送到自己的github仓库
git push origin new_branch

三、修改操作
1.撤销commit
git reset --soft HEAD^
这样就成功撤销了commit，如果想要连着add也撤销的话，–soft改为–hard（删除工作空间的改动代码）。
命令详解：
HEAD^ 表示上一个版本，即上一次的commit，也可以写成HEAD~1
如果进行两次的commit，想要都撤回，可以使用HEAD~2
–soft
不删除工作空间的改动代码 ，撤销commit，不撤销git add file
–hard
删除工作空间的改动代码，撤销commit且撤销add



# 下载远程仓库的所有变动
git fetch https://github.com/move-cn/letsmove
或者git fetch --all
更新仓库
git pull origin main
git branch查看当前分支

四、解决问题
1.删除文件
解决方案：完全删除大文件
要从历史记录中完全删除这些大文件，你可以使用 git filter-repo 工具。以下是具体步骤：
安装 git-filter-repo：
如果你还没有安装 git-filter-repo，请先进行安装。可以参考 Git Filter Repo 的安装说明。
使用 git filter-repo 删除文件：
运行以下命令，以从历史记录中完全删除这两个大文件：
   git filter-repo --path java/move.mp4 --path java/xxx1.mp4 --invert-paths
这个命令会从所有历史提交中删除 java/move.mp4 和 java/xxx1.mp4 文件。
检查历史记录：
再次检查这两个文件是否已被完全移除：
   git log -- java/move.mp4
   git log -- java/xxx1.mp4
如果没有输出，说明这两个文件已成功从历史记录中删除。
强制推送到远程：
现在，你可以再次尝试强制推送到远程仓库：
   git push -f origin main