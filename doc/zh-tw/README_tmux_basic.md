# tmux 常用操作

## 啟用 tmux

```bash
tmux
```

## 退出 tmux

```bash
ctrl+d
```

## 創建一個新的窗口

先按 `ctrl+b`，再按 `c`。

```bash
ctrl+b c
```

## 關閉一個窗口

```bash
ctrl+d
```

## 窗口之間切換

### 切換到上一個使用的窗口

```bash
ctrl+b l （小寫字母l）
```

### 切換到 1 號窗口

```bash
ctrl+b 1 （數字1）
```

### 切換到 2 號窗口

```bash
ctrl+b 2
```

### 切換到 n 號窗口

```bash
ctrl+b n
```

## 創建一個新的麵板

### 創建一個新的水平麵板

```bash
ctrl+b shift+"
```

### 創建一個新的垂直麵板

```bash
ctrl+b shift+%
```

## 關閉一個麵板

```bash
ctrl+d
```

## 麵板之間切換

### 切換到左側麵板

```bash
alt+h
```

### 切換到右側麵板

```bash
alt+l
```

### 切換到下側麵板

```bash
alt+j
```

### 切換到上方麵板

```bash
alt+k
```

## 複製模式

### 在 tmux 的不同麵板之間複製

```
ctrl+b [ 進入複製模式
用 vim 操作移動光標
space 開始複製
enter 複製完成
ctrl+b ] 粘貼
```

### 複製到係統剪切板

這個需要用到 **xclip**，`sudo apt-get install xclip` 安裝 **xclip**。

```
先用 ctrl+b [ 進入複製模式複製
然後用 ctrl+b ctrl+c 把 tmux 緩衝區中的內容複製到係統剪切板
用 ctrl+b ctrl+v 把係統剪切板複製到 tmux
```

## 調整麵板大小

先按 `ctrl+b`，然後按著 `ctrl` 鍵不放，按方向鍵調整麵板大小。

```bash
ctrl+b ctrl+方向鍵
```

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

