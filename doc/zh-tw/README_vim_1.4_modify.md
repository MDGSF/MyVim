# vim 修改文本

前麵兩章介紹的**光標移動**和**文本查找**都是在普通模式下進行的，
這一章介紹的修改文本需要在插入模式下進行。

在普通模式下按 `i` 就可以進入插入模式，在插入模式下可以輸入文本。

按 `<Esc>` 可以回到普通模式，在普通模式下移動光標。

更多模式相關的見 [vim 模式](README_vim_2_mode.md)。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_22.gif" alt="vim_1.4_modify_22.gif" />
</details>

請多多練習這個操作，直到你熟悉了為止：按 `i` 進入插入模式，輸入文本，
按 `<Esc>` 返回普通模式，移動光標位置。再按 `i` 進入插入模式....

## 刪除光標所在的字符

在普通模式下，直接按 `x`，刪除字符，並把刪除掉的字符放到 vim 的緩衝區中。

```
x
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_01.gif" alt="vim_1.4_modify_01.gif" />
</details>

## 刪除單詞 de

從光標所在位置一直刪除到光標所在的單詞的最末尾。

如果光標位於單詞的開頭，就會刪除整個單詞。

```
de
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_02.gif" alt="vim_1.4_modify_02.gif" />
</details>

## 刪除單詞 dw

從光標所在位置一直刪除到光標所在的單詞下一個單詞的最開頭。

如果光標位於單詞的開頭，就會刪除整個單詞。

```
dw
```

`d3w` 刪除 3 個連續的單詞。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_03.gif" alt="vim_1.4_modify_03.gif" />
</details>

## 從光標所在位置刪除到當前行末尾

```
d$
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_04.gif" alt="vim_1.4_modify_04.gif" />
</details>

## 從光標所在位置刪除到文檔末尾

```
d shift+G
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_05.gif" alt="vim_1.4_modify_05.gif" />
</details>

## 從光標所在位置刪除到文檔開頭

```
dgg
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_06.gif" alt="vim_1.4_modify_06.gif" />
</details>

## 刪除行

`dd` 刪除當前行

`4dd` 刪除 4 行

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_07.gif" alt="vim_1.4_modify_07.gif" />
</details>

## 刪除括號中的內容，包括括號

```
d%
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_08.gif" alt="vim_1.4_modify_08.gif" />
</details>

## 複製

`yy` 複製當前行到緩衝區。

先按 `v` 進入 VISUAL 模式，選中文本，再按 `y` 可以複製指定
內容到緩衝區。

## 粘貼

`p` 粘貼緩衝區中的內容到光標所在位置後麵。

`shift+P` 粘貼緩衝區中的內容到光標所在位置前麵。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_09.gif" alt="vim_1.4_modify_09.gif" />
</details>

## 合並

`shift+J` 把光標所在行的下一行添加到當前行的末尾。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_10.gif" alt="vim_1.4_modify_10.gif" />
</details>

## 快速交換前後兩個字符

```
xp
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_11.gif" alt="vim_1.4_modify_11.gif" />
</details>

## 快速交換上下兩行

```
ddp
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_12.gif" alt="vim_1.4_modify_12.gif" />
</details>

## 修改光標所在的字母

`rx` 把光標所在的字母修改為 `x`。

`ra` 把光標所在的字母修改為 `a`。

`rb` 把光標所在的字母修改為 `b`。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_13.gif" alt="vim_1.4_modify_13.gif" />
</details>

## 刪除光標所在位置直到單詞末尾，並進入插入模式

```
ce
cw
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_14.gif" alt="vim_1.4_modify_14.gif" />
</details>

## 刪除光標所在位置直到當前行末尾，並進入插入模式

```
c$
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_15.gif" alt="vim_1.4_modify_15.gif" />
</details>

## 刪除括號內，並進入插入模式

```
ci(
```

## 刪除雙引號內，並進入插入模式

```
ci"
```

## 大小寫轉換

`shift+~` 把光標所在的字母，大寫變小寫，小寫變大寫。
如果在 VISUAL 模式下選中了字符串，再按 `shift+~`，則會
把每個字母大小寫互換。

`gu` 把選中的字符串轉換為小寫。

`gU` 把選中的字符串轉換為大寫。

`gU` 按鍵方式：先按一下 `g`，然後放開，再按 `shift+U`。

`guu` 把當前行全部變成小寫。

`gUU` 把當前行全部變成大寫。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_16.gif" alt="vim_1.4_modify_16.gif" />
</details>

## 刪除每行末尾空白字符

```
:%s/\s\+$//e
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_17.gif" alt="vim_1.4_modify_17.gif" />
</details>

## 刪除所有空行

```
:g/^$/d
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_18.gif" alt="vim_1.4_modify_18.gif" />
</details>

## 批量插入多行

1. `ctrl+v` 進入 `VISULA BLOCK` 模式。
2. `h,j,k,l` 方向鍵進行選擇。
3. `shift+I` 插入。
4. `Esc` 插入完成。

這個可以用來注釋多行代碼。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_19.gif" alt="vim_1.4_modify_19.gif" />
</details>

## 批量刪除多行

1. `ctrl+v` 進入 `VISULA BLOCK` 模式。
2. `h,j,k,l` 方向鍵進行選擇。
3. `d` 將選中的部分全部刪除。

這個可以將多行注釋刪除。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_20.gif" alt="vim_1.4_modify_20.gif" />
</details>

## 批量插入多行末尾

1. `ctrl+v` 進入 `VISULA BLOCK` 模式。
2. `h,j,k,l` 方向鍵進行選擇。
3. `shift+$`。
3. `shift+A` 插入。
4. `Esc` 插入完成。

這個可以用來給每行加上句號。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_21.gif" alt="vim_1.4_modify_21.gif" />
</details>

## 取消

`u` 用來取消之前的操作。比如刪除了太多了，用 `u` 來恢複。

## 重做

`ctrl+r` 用來重做被 `u` 取消掉的操作。

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_1.4_modify_23.gif" alt="vim_1.4_modify_23.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> [上一章](README_vim_1.3_search.md)
>
> [下一章](README_vim_1.5_substitute.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

