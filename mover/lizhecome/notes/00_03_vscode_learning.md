# VS Code 零基础学习笔记

## 1. 安装和认识界面

- **下载 VS Code**： [VS Code 官网](https://code.visualstudio.com/)
- **安装过程**：选择系统对应的安装包并完成安装。
- **界面介绍**：
  - **侧边栏**：包含资源管理器、搜索、源代码管理、调试、扩展等工具。
  - **编辑区**：用于代码编写，支持多文件多标签打开。
  - **状态栏**：显示文件编码、语言模式、行列号、Git 分支等状态信息。
  - **终端窗口**：内嵌终端，便于直接运行代码和管理项目。

## 2. 更改语言 & 了解菜单内容

- **语言切换**：
  - 进入设置（`File > Preferences > Settings`），选择语言选项。
  - 也可通过安装语言包进行界面语言切换，如中文扩展包。
- **菜单内容**：
  - **文件 (File)**：创建新文件、打开文件夹、保存项目。
  - **编辑 (Edit)**：查找、替换、格式化代码。
  - **视图 (View)**：控制界面显示内容（例如侧边栏、调试窗口）。
  - **终端 (Terminal)**：打开/关闭集成终端，支持多终端管理。

## 3. 交互式演练场

- 使用 `Help > Interactive Playground` 进入 VS Code 的交互式学习场景。
- 该模块提供基础功能演练，如代码片段、快速修复、多光标等操作。

## 4. 我所倾向的 VS Code 基础配置

- **主题**：选择护眼的主题（如“Solarized Dark”或“Monokai”）。
- **字体**：推荐字体设置 `Fira Code` 或 `Cascadia Code`，并启用连字功能。
- **自动保存**：进入 `File > Preferences > Settings` 中开启“Auto Save”选项，减少忘记保存的风险。
- **代码格式化**：设置默认格式化工具（如 Prettier），保持代码整洁。
- **快捷键**：熟悉常用快捷键，如 `Ctrl + P` (快速打开文件)、`Ctrl + Shift + P` (命令面板)。

## 5. 前端开发效率利器 Emmet 的使用和配置

- **Emmet** 是内置在 VS Code 中的快速 HTML/CSS 编写工具。
- **配置**：
  - 进入设置 (Settings)，搜索“Emmet”，进行偏好配置。
  - 如想为 JSX 启用 Emmet，需在 `settings.json` 中添加：
    ```json
    "emmet.includeLanguages": {
        "javascript": "javascriptreact"
    }
    ```
- **常用 Emmet 缩写**：
  - `div.container>ul>li.item*5` → 自动生成包含 5 个 `li` 的 `div` 和 `ul` 结构。

## 6. 插件 - Live Server

- **安装方法**：打开扩展 (Extensions) 面板，搜索 `Live Server` 并安装。
- **功能**：实时预览 HTML 页面，更改代码后会自动刷新浏览器。
- **使用**：右键 HTML 文件并选择“Open with Live Server”。

## 7. 从源代码编译属于自己的 VS Code

- 从 GitHub 官方仓库克隆 VS Code 源代码。
- 使用 Node.js 和 Yarn 进行项目依赖安装与打包。
- **步骤简述**：
  1. 克隆仓库 `git clone https://github.com/microsoft/vscode.git`
  2. 进入目录并运行 `yarn` 安装依赖。
  3. 使用 `yarn watch` 进行构建，完成后运行 `yarn run electron` 启动。

## 8. Emmet 缩写的展开上限

- Emmet 默认展开上限为 100 个元素，可在设置中调整 `emmet.variables.max_repeat` 值。

## 9. 灵活运用代码片段，代码输入效率翻倍

- **使用代码片段**：VS Code 提供多种预设代码片段。
- **自定义代码片段**：
  - 进入 `File > Preferences > User Snippets` 创建自定义代码片段。
  - 定义格式如下：
    ```json
    "Print to console": {
      "prefix": "log",
      "body": ["console.log('$1');"],
      "description": "Log output to console"
    }
    ```

## 10. 必须掌握的多光标功能

- **多光标添加**：
  - `Alt + Click` (Windows) 或 `Option + Click` (Mac) 可添加多光标。
  - 使用 `Ctrl + D` 快速选中多个相同单词。
- **多行编辑**：按住 `Shift + Alt + Down/Up` 创建多行光标，实现多行同步编辑。

## 11. 鼠标操作的技巧

- **快速选择相同词**：双击单词，并按 `Ctrl + D` (Win) 或 `Cmd + D` (Mac) 继续选择相同单词。
- **代码折叠**：点击代码行号左侧的小箭头可折叠/展开代码块。
- **快速关闭标签**：在标签上点击鼠标中键，快速关闭该标签。

通过以上内容的学习和设置，相信大家可以更高效地使用 VS Code！

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)