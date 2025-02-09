# Stata-xhelp

🚀 **xhelp 提供 Stata 命令的中文帮助文档，用户可使用 `xhelp` 命令直接查看翻译后的 Stata 帮助文件**

本项目从 Stata base 目录中收集 `.sthlp` 帮助文档，并通过调用 **大语言模型 API** 进行批量翻译

翻译完成后，将结果打包为 Stata 拓展命令 `xhelp`。用户可将其放入 `PLUS` 文件夹中，并在 Stata 内调用。

---

## ✨ 功能特点
- 🗂 **批量翻译**：提供所有 Stata 命令的中文帮助文档
- 📖 **简单调用**：使用 `xhelp` 命令快速查询翻译后的帮助内容
- 🔗 **兼容 Stata**：与 Stata `help` 命令类似，易于集成到工作流中

---

## 📦 使用说明
### 1️⃣ **下载 xhelp 命令**
🎯**从 GitHub 下载并解压**
- 点击 **`Code`** 按钮，选择 **`Download ZIP`**
- 解压后，将 `xhelp/` 目录放入合适的位置

### 2️⃣ **设置 Stata PLUS 目录**
🎯 **将 `xhelp` 文件夹移动至 Stata 的 PLUS 目录**
- 在 Stata 中运行：
```stata
sysdir // 显示Stata系统文件夹列表 (也可使用 adopath 命令)
sysdir set PLUS "DIRECTORY" // 如果需要，可以调整 PLUS 目录位置

// 安装 xhelp
net install xhelp, from("DIRECTORY") replace 
// b为所下文件夹中的的 xhelp 文件夹的地址，replace 选项可以覆盖已有的安装（可删除）
```

### 3️⃣ **运行 xhelp 命令**
```stata
xhelp // 调用命令 查看 xhelp 命令功能

// 以 reg 命令为例
help reg // Stata 原命令：打开 reg 命令的帮助文档
xhelp reg // xhelp功能：打开翻译后的中文版帮助文档
```


