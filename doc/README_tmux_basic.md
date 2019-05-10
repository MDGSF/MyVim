# tmux 常用操作

## 启用 tmux

```bash
tmux
```

## 退出 tmux

```bash
ctrl+d
```

## 创建一个新的窗口

先按 `ctrl+b`，再按 `c`。

```bash
ctrl+b c
```

## 关闭一个窗口

```bash
ctrl+d
```

## 窗口之间切换

### 切换到上一个使用的窗口

```bash
ctrl+b l （小写字母l）
```

### 切换到 1 号窗口

```bash
ctrl+b 1 （数字1）
```

### 切换到 2 号窗口

```bash
ctrl+b 2
```

### 切换到 n 号窗口

```bash
ctrl+b n
```

## 创建一个新的面板

### 创建一个新的水平面板

```bash
ctrl+b shift+"
```

### 创建一个新的垂直面板

```bash
ctrl+b shift+%
```

## 关闭一个面板

```bash
ctrl+d
```

## 面板之间切换

### 切换到左侧面板

```bash
alt+h
```

### 切换到右侧面板

```bash
alt+l
```

### 切换到下侧面板

```bash
alt+j
```

### 切换到上方面板

```bash
alt+k
```

## 复制模式

### 在 tmux 的不同面板之间复制

```
ctrl+b [ 进入复制模式
用 vim 操作移动光标
space 开始复制
enter 复制完成
ctrl+b ] 粘贴
```

### 复制到系统剪切板

这个需要用到 **xclip**，`sudo apt-get install xclip` 安装 **xclip**。

```
先用 ctrl+b [ 进入复制模式复制
然后用 ctrl+b ctrl+c 把 tmux 缓冲区中的内容复制到系统剪切板
用 ctrl+b ctrl+v 把系统剪切板复制到 tmux
```

## 调整面板大小

先按 `ctrl+b`，然后按着 `ctrl` 键不放，按方向键调整面板大小。

```bash
ctrl+b ctrl+方向键
```

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

