# Text object selection

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

快速文本选择。上面的操作都需要在 [VISUAL 模式](README_vim_2_mode.md)
下使用，或者也可以在复制的时候使用。

- `vaw`: 快速选中光标所在的单词
- `yaw`: 快速复制光标所在的单词

### 查看上述命令的详细帮助文档

```
:help motion.txt

6. Text object selection
```

### 快速选中一个单词

```
aw
```

<details>
<summary>展开查看图片</summary>
<img src="../../images/vim_2_text_object_01.gif" alt="vim_2_text_object_01.gif" />
</details>

