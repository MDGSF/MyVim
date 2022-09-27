## Rust

```sh
# 更新 rust
rustup update stable

# 在当前目录使用 nightly 版本的 rust
rustup override add nightly
```

### cargo 配置文件路径

https://doc.rust-lang.org/cargo/reference/config.html#hierarchical-structure

1. 在目录 `/projects/foo/bar/baz` 中调用 cargo，查找顺序如下
2. `/projects/foo/bar/baz/.cargo/config.toml`
3. `/projects/foo/bar/.cargo/config.toml`
4. `/projects/foo/.cargo/config.toml`
5. `/projects/.cargo/config.toml`
6. `/.cargo/config.toml`
7. `$HOME/.cargo/config.toml`

### cross compile

```sh
# 查看支持的平台
rustup target list | pr -tw150 --columns 3
rustc --print target-list | pr -tw100 --columns 3
# 添加指定平台的编译环境
rustup target add aarch64-unknown-linux-gnu
# 在 cargo 配置文件中添加
[target.aarch64-unknown-linux-gnu]
linker = "xxx/xxx/aarch64-xx-xx-gcc"
# 使用指定平台进行编译
cargo build --target=aarch64-unknown-linux-gnu
```

### Rust 终端工具

https://old.reddit.com/r/rust/comments/oygrp1/your_favorite_rust_cli_utility_i_have_my_top_10/

- fd：另一个find
- pastel：终端颜色显示
- as-tree：另一个tree
- bat：另一个cat
- du-dust：另一个du
- fnm：NodeJS 版本管理
- kondo：清理node_modules
- lsd：ls+颜色
- zoxide：聪明的cd
- mdcat：用于MD文档的cat
- tokei：打印代码
- navi：命令行CheatSheet
- battop
- btm
- exa
- rg
- just
