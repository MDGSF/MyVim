# Text object selection 文本對象選擇

這是一係列隻能在 [VISUAL 模式](README_vim_2_mode.md) 下使用的命令，或者是
緊跟在一個操作符之後。比如：`y` 複製，`d` 刪除。

- `aw`: "a word"
- `iw`: "inner word"
- `aW`: "a WORD"
- `iW`: "inner WORD"
- `as`: "a sentence"
- `is`: "inner sentence"
- `ap`: "a paragraph"
- `ip`: "inner paragraph"
- `a]`, `a[`: "a [] block"
- `i]`, `i[`: "inner [] block"
- `a)`, `a(`, `ab`: "a block"
- `i)`, `i(`, `ib`: "inner block"
- `a>`, `a<`: "a <> block"
- `i>`, `i<`: "inner <> block"
- `at`: "a tag block"
- `it`: "inner tag block"
- `a}`, `a{`, `aB`: "a Block"
- `i}`, `i{`, `iB`: "inner Block"
- `a"`, `a'`, `` a` ``: "a quoted string"
- `i"`, `i'`, `` i` ``: "a quoted inner string"

### 具體例子

- `vaw`: 選中光標所在的單詞
- `yaw`: 複製光標所在的單詞
- `daw`: 刪除光標所在的單詞
- `vip`: 選中光標所在的段落
- `yip`: 複製光標所在的段落
- `dip`: 刪除光標所在的段落
- `vi"`: 選中光標所在的雙引號中的內容
- `yi"`: 複製光標所在的雙引號中的內容
- `di"`: 刪除光標所在的雙引號中的內容

### 查看上述命令的詳細幫助文檔

```
:help motion.txt

6. Text object selection
```

### 快速選中一個單詞

```
aw
```

<details>
<summary>展開查看圖片</summary>
<img src="../../images/vim_2_text_object_01.gif" alt="vim_2_text_object_01.gif" />
</details>

* * *

> 按 `gg` 回到文檔頂部。
>
> 將光標移動到下麵的文件名上，執行 `gf` 跳轉。
>
> [目錄](README.md)
>
> <a href='https://github.com/MDGSF/MyVim'><small>↑Back to Home↑</small></a>

