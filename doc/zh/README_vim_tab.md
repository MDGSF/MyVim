# vim 标签页介绍

## 新建一个标签页

```
:help :tabnew
:[count]tabe[dit]
:[count]tabnew
:[count]tabnew {file}
```

```
:tabnew    在当前标签页后面新建一个新的标签页
:+tabnew   在当前标签页的下一个标签页后面新建一个新的标签页
:-tabnew   在当前标签页前面新建一个新的标签页
:0tabnew   在最左边建立一个新的标签页
:$tabnew   在最右边建立一个新的标签页
```

添加映射 `map <leader>ti :tabnew<cr>` 之后，可以使用 `,ti`。

## 查看所有的标签页

```
:tabs
```

## 关闭除了当前标签页之外的所有标签页

```
:help :tabonly
:tabo[nly][!]
:{count}tabo[nly][!]
```

```
:tabonly    关闭除了当前标签页之外的所有标签页
:-tabonly   关闭除了当前标签页的前一个标签页之外的所有标签页
:+tabonly   关闭除了当前标签页的后一个标签页之外的所有标签页
:1tabonly   关闭除了第一个标签页之外的所有标签页
:$tabonly   关闭除了最后一个标签页之外的所有标签页
```

添加映射 `map <leader>to :tabonly<cr>` 之后，可以使用 `,to`。

## 关闭当前标签页

```
:help :tabclose
:tabc[lose][!]
:{count}tabc[lose][!]
:tabc[lose][!] {count}
```

```
:tabclose    关闭当前标签页
:-tabclose   关闭前一个标签页
:+tabclose   关闭后一个标签页
:1tabclose   关闭第一个标签页
:$tabclose   关闭最后一个标签页
```

添加映射 `map <leader>tc :tabclose<cr>` 之后，可以使用 `,tc`。

## 移动到下一个标签页

```
:tabn[ext] {count}
{count}gt
```

添加映射 `map <leader>tn :tabnext<cr>` 之后，可以使用 `,tn`。

## 移动到上一个标签页

```
:tabp[revious]
:tabN[ext]
gT
```

添加映射 `map <leader>tp :tabprev<cr>` 之后，可以使用 `,tp`。

## 移动到第一个标签页

```
:tabr[ewind]
:tabfir[st]
```

## 移动到最后一个标签页

```
:tabl[ast]
```

## 移动当前标签页

```
:tabm[ove] [N]
:[N]tabm[ove]
```

移动当前标签页到第 `N` 个标签页之后。

```
:-tabmove    当前标签页左移
:+tabmove    当前标签页右移

:0tabmove    当前标签页移动到最左边
:tabmove 0   当前标签页移动到最左边

:tabmove     当前标签页移动到最右边
:$tabmove    当前标签页移动到最右边
:tabmove $   当前标签页移动到最右边
```

添加映射 `map <leader>tm :tabmove` 之后，可以使用 `,tm`。

<a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

