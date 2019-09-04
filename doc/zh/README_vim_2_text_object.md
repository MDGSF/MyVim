# Text object selection 文本对象选择

这是一系列只能在 [VISUAL 模式](README_vim_2_mode.md) 下使用的命令，或者是
紧跟在一个操作符之后。比如：`y` 复制，`d` 删除。

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

### 具体例子

- `vaw`: 选中光标所在的单词
- `yaw`: 复制光标所在的单词
- `daw`: 删除光标所在的单词
- `vip`: 选中光标所在的段落
- `yip`: 复制光标所在的段落
- `dip`: 删除光标所在的段落
- `vi"`: 选中光标所在的双引号中的内容
- `yi"`: 复制光标所在的双引号中的内容
- `di"`: 删除光标所在的双引号中的内容

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

