# vim 替換文本

```
:help :s
:[range]s[ubstitute]/{pattern}/{string}/[flags] [count]
```

## 替換光標所在行的第一個 `old` 字符串

```
:s/old/new
```

## 替換光標所在行的所有 `old` 字符串

```
:s/old/new/g
```

## 替換指定行的所有 `old` 字符串

下麵的兩個 `#` 分彆代表起始行和結束行

```
:#,#s/old/new/g
```

## 替換文檔中的所有 `old` 字符串

```
:%s/old/new/g
```

## 替換文檔中的所有 `old` 字符串

每一個替換都需要確認

```
:%s/old/new/gc
```

確認選項：

```
y: 替換這個匹配
n: 跳過這個匹配
a: 替換當前到文檔末尾的所有匹配
q: 退出替換
l: 替換當前匹配，然後退出替換
```

## 替換時區分大小寫

```
:%s/old/new/gcI
```

也可以先執行下 `:set noignorecase`

## 替換時不區分大小寫

```
:%s/old/new/gci
```

也可以先執行下 `:set ignorecase`

在 `old` 後麵加上 `\c` 也可以忽略大小寫。

```
:%s/old\c/new/gc
```

## 替換時搜索完整單詞

```
:%s/\<old\>/new/gc
```

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.4_modify.md)
>
> [下一章](README_vim_1.6_tab.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

