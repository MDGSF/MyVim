# vim 常用映射

## leader

把 leader 映射為逗號 `,`。

```
let mapleader=","
let g:mapleader=","
```

## 保存

先按逗號 `,`，然後再按下 `w`，就會保存文件。

```
nmap <leader>w :w!<cr>
```

## 取消高亮

先按逗號 `,`，然後再按下回車鍵，高亮就會取消。

```
map <silent> <leader><cr> :noh<cr>
```

## 在不同的窗口之間跳轉

用 `ctrl+h,j,k,l` 在不同的窗口之間上下左右跳轉。

```
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
```

## 退出當前 buffer

這個操作不會關閉 `vim`，隻會把正在編輯的文件關閉。

```
map <leader>bd :Bclose<cr>:tabclose<cr>gT
```

## 關閉所有 buffer

```
map <leader>ba :bufdo bd<cr>
```

## 把工作目錄切換到當前正在編輯的文件

用 `:pwd` 可以看到工作目錄

```
map <leader>cd :cd %:p:h<cr>:pwd<cr>
```

## (VISUAL 模式) 搜索

在 VISUAL 模式下也可以直接使用 `*` 和 `#` 來搜索選中的文本。

```
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
```

## (VISUAL 模式) ack.vim 搜索

先進入 VISUAL 模式，選中文本，然後按下 `gv`。

```
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
```

## (插入模式) 快速插入當前時間

輸入 `xdate` 加一個空格，就會自動轉化為當前日期時間。

```
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
```

## (命令行模式) 刪除到上一個反斜杠

輸入 `$q`，會從光標所在位置一直向左刪除到反斜杠 `\`c。

```
cno $q <C-\>eDeleteTillSlash()<cr>
```

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

