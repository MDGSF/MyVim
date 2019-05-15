# vim 移動光標

如果你已經本章內容，可以按 `shift+G` 移動光標到文檔底部進入下一章。

掌握了這一章的內容之後，就可以使用 vim 來閱讀剩下的所有文檔了。

移動光標 vim 需要處於普通模式，看下左下角，如果有顯示 `NORMAL`
說明就是普通模式，如果不是的話，隻要按 `<Esc>` 鍵就會回到普通模式。
更多關於模式的知識點將在 [vim 模式](README_vim_2_mode.md) 那一章介紹。

## 上下左右移動光標

```
h, j, k, l
```

* h 光標向左移動一個字符
* j 光標向下移動一行
* k 光標向上移動一行
* l 光標向右移動一個字符

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_01.gif" alt="vim_1.2_move_cursor_01.gif" />
</details>

## 快速上下移動光標

```
ctrl+u
ctrl+d
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_02.gif" alt="vim_1.2_move_cursor_02.gif" />
</details>

## 光標移動到行首

```
:help 0    查看幫助文檔
0          移動光標到當前行的第一個字符
<Home>     移動光標到當前行的第一個字符
shift+^    移動光標到當前行的第一個非空白字符
shift+B
```

`shift+B` 是在配置文件中添加了映射。

```
nnoremap B ^
```

## 光標移動到行末尾

```
shift+$
shift+E
```

`shift+E` 是在配置文件中添加了映射。

```
nnoremap E $
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_03.gif" alt="vim_1.2_move_cursor_03.gif" />
</details>

## 光標移動到最開頭

```
gg
```

## 光標移動到最末尾

```
shift+G
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_04.gif" alt="vim_1.2_move_cursor_04.gif" />
</details>

## 光標移動到指定行

`:100 enter` 跳轉到第 100 行

`100 shift+G` 跳轉到第 100 行

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_05.gif" alt="vim_1.2_move_cursor_05.gif" />
</details>

## 查看當前處於第幾行、第幾列

```
ctrl+G
```

## 移動到下一個單詞的開頭

```
w
```

## 移動到單詞的末尾

如果光標處於一個單詞的末尾，`e` 就會把光標移動到下一個單詞的末尾。

否則光標就會移動到當前單詞的末尾。

```
e
```

## 移動到上一個單詞的開頭

如果光標處於一個單詞的開頭，`b` 就會把光標移動到上一個單詞的開頭。

否則光標就會移動到當前單詞的開頭。

```
b
```

## 把光標所在的行移動到屏幕正中間

```
zz
```

## 把光標所在的行移動到屏幕最上方

```
zt
```

## 把光標所在的行移動到屏幕最下方

```
zb
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_06.gif" alt="vim_1.2_move_cursor_06.gif" />
</details>

## 在括號之間跳轉光標

如果光標處於括號上 `(), [], {}`，用 `%` 可以將光標移動到對應的另一半括號上。

> 你可以在下麵代碼上的 (),[],{} 字符上按 % 看看效果，多按幾次直到你熟悉它為止。

```
func main() {
	num := ((1 + 2) * (4 - 3)) / 3
	fmt.Println("vim-go, num =", num)
}
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.2_move_cursor_07.gif" alt="vim_1.2_move_cursor_07.gif" />
</details>

## 移動光標到之前所在的位置

```
ctrl+o （小寫字母o）
```

## 光標向後移動 2 個單詞

```
2w
```

## 光標向後移動 3 個單詞

```
3e
```

## 光標向下移動 10 行

```
10j
```

## 光標向上移動 10 行

```
10k
```

**注意：** 在命令前麵加上數字 `N` 表示執行這個命令 `N` 次。

**最後，在進入下一章之前，請確保已經熟悉了本章的操作。
如果覺得操作還不太習慣，那就在該文檔中多執行幾次。**

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.1_open_close.md)
>
> [下一章](README_vim_1.3_search.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

