# vim 查找文本

## 查找光標所在的單詞

`shift+*` 向下查找完整的單詞，`/\<keyword\>`。

`shift+#` 向上查找完整的單詞

`g*` 按鍵方式 `g shift+*`，向下查找，可以是其他單詞的一部分，`/keyword`。

`g#` 按鍵方式 `g shift+#`，向上查找，可以是其他單詞的一部分。

`gd` 和 `*` 查找類似，不過會嘗試略過注釋，不過應該不會真的去分析語法，可能對於 C
語言支持的比較好，其他的文件的話，使用起來應該就和 `*` 是差不多的，而 `*` 就
隻是單純的文本查找。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_01.gif" alt="vim_1.3_search_01.gif" />
</details>

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_02.gif" alt="vim_1.3_search_02.gif" />
</details>

## 向下查找

直接按 `/`，然後輸入要查找的字符串。

```
/searchstring
```

然後按 `n` 不斷向下查找，按 `shift+n` 向上查找。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_03.gif" alt="vim_1.3_search_03.gif" />
</details>

## 向上查找

直接按 `?`，然後輸入要查找的字符串。

```
?searchstring
```

然後按 `n` 不斷向上查找，按 `shift+n` 向下查找。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_04.gif" alt="vim_1.3_search_04.gif" />
</details>

## 查找選中的字符串

### 方法一

按 `v` 進入 `VISUAL` 模式，然後選擇字符串，按 `y` 複製。

然後按 `/` 進入搜索模式。

按 `ctrl+r shift+"` 粘貼緩衝區的內容到搜索區域。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_05.gif" alt="vim_1.3_search_05.gif" />
</details>

### 方法二

選擇好字符串之後，直接按 `*` 向下查找，按 `#` 向上查找。

需要在配置文件中增加如下配置：

```
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_06.gif" alt="vim_1.3_search_06.gif" />
</details>

## 查找時區分大小寫

```
:set noignorecase
```

## 查找時不區分大小寫

```
:set ignorecase
```

或者在要查找的字符串後麵加上 `\c` 也是可以的：

```
/searchstring\c
```

## 查找完整單詞

```
/\<searchstring\>
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_07.gif" alt="vim_1.3_search_07.gif" />
</details>

## 取消查找之後的高亮

很多時候，在查找到你想要的位置之後，就不需要高亮了。

這時候就可以通過 `:noh` 取消高亮。

還可以通過 `先按逗號，再按回車` 來取消掉高亮。
這個需要在配置文件中加上如下映射：

```
map <silent> <leader><cr> :noh<cr>
```

還有一種方法可以取消高亮，那就是隨便搜索一個不存在的字符串，我估計應該也有人這麼使用。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.3_search_08.gif" alt="vim_1.3_search_08.gif" />
</details>

## f 和 F 單行搜索命令

`f` 是向後查找，`F` 是向前查找。

`fs` 在光標所在行搜索字母 `s`。

`fa` 在光標所在行搜索字母 `a`。

`f1` 在光標所在行搜索數字 `1`。

`f2` 在光標所在行搜索數字 `2`。

## 重複 f 搜索命令

第一次使用 `f` 來搜索之後，相同的查找就可以使用分號 `;`。

`;` 是繼續向當前方向查找下一個字母。

`,` 是向當前相反方向查找。

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.2_move_cursor.md)
>
> [下一章](README_vim_1.4_modify.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

