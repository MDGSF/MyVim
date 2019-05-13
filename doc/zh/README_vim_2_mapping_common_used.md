# vim 常用映射

## leader

把 leader 映射为逗号 `,`。

```
let mapleader=","
let g:mapleader=","
```

## 保存

先按逗号 `,`，然后再按下 `w`，就会保存文件。

```
nmap <leader>w :w!<cr>
```

## 取消高亮

先按逗号 `,`，然后再按下回车键，高亮就会取消。

```
map <silent> <leader><cr> :noh<cr>
```

## 在不同的窗口之间跳转

用 `ctrl+h,j,k,l` 在不同的窗口之间上下左右跳转。

```
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
```

## 退出当前 buffer

这个操作不会关闭 `vim`，只会把正在编辑的文件关闭。

```
map <leader>bd :Bclose<cr>:tabclose<cr>gT
```

## 关闭所有 buffer

```
map <leader>ba :bufdo bd<cr>
```

## 把工作目录切换到当前正在编辑的文件

用 `:pwd` 可以看到工作目录

```
map <leader>cd :cd %:p:h<cr>:pwd<cr>
```

## (VISUAL 模式) 搜索

在 VISUAL 模式下也可以直接使用 `*` 和 `#` 来搜索选中的文本。

```
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
```

## (VISUAL 模式) ack.vim 搜索

先进入 VISUAL 模式，选中文本，然后按下 `gv`。

```
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
```

## (插入模式) 快速插入当前时间

输入 `xdate` 加一个空格，就会自动转化为当前日期时间。

```
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
```

## (命令行模式) 删除到上一个反斜杠

输入 `$q`，会从光标所在位置一直向左删除到反斜杠 `\`c。

```
cno $q <C-\>eDeleteTillSlash()<cr>
```

* * *

> 按 `gg` 回到文档顶部。
>
> 将光标移动到下面的文件名上，执行 `gf` 跳转。
>
> [目录](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

