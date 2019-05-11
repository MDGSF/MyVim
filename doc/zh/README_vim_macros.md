# Vim 宏录制

```
:help record
```

`q{0-9a-zA-Z"}` 开始录制到寄存器 `{0-9a-zA-Z"}`

`q` 停止录制。

### 例子

把下面的函数返回值全部改为 `int`，并且给每行末尾加上分号。

```
void encrypt_text(char *text, int bytes)
void decrypt_text(char *text, int bytes)
void process_text(char *text, int bytes)
void another_important_function(int bytes, double precision)
```

1. 光标移动到第一行的最开头。
2. `qa` 开始录制到寄存器 `a`。
3. `cw` 删除 `void` 并进入插入模式。
4. 输入 `int`，然后按 `<Esc>` 返回普通模式。
5. `shift+a` 在第一行末尾进入插入模式。
6. 输入 `;`，然后按 `<Esc>` 返回普通模式。
7. 按 `0` 返回第一行行首。
8. `q` 停止录制。

1. 光标移动到第二行。
2. 输入 `@a` 对第二行应用寄存器 `a` 中录制的宏。
3. 光标移动到第三行。
4. 输入 `@@` 对第三行应用上一次使用的宏。

