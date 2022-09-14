# ruby

```sh
# 使用 rbenv 进行版本管理
# https://github.com/rbenv/rbenv
rbenv install -l
rbenv install 3.0.2
rbenv versions
rbenv global 3.0.2
rbenv global
rbenv local 2.7.4
rbenv local
rbenv rehash # 切换ruby版本之后必须执行这个命令

# 查看文档
# https://ruby-doc.org/
ri Array
ri Array.sort
ri Hash#each
ri Math::sqrt

# 执行 ruby 脚本
ruby hello.rb
# 启动交互式环境
irb

# 指定编码
ruby -E UTF-8 hello.rb
irb -E UTF-8

# 简化 irb 的输出结果
irb --simple-prompt

# https://mirror.tuna.tsinghua.edu.cn/help/rubygems/
# 添加 TUNA 源并移除默认源
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
# 列出已有源，应该只有 TUNA 一个
gem sources -l
# 使用以下命令替换 bundler 默认源
bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems

gem list # 列出本地已经安装的
gem search redis # 搜索远程
gem search -l sqlite # 搜索本地
gem install sqlite3 # 安装
```

