# mcap

- <https://mcap.dev/>
- <https://github.com/foxglove/schemas>
- <https://docs.foxglove.dev/docs/introduction/>

```sh
mcap -h

mcap cat test.mcap
mcap cat demo.mcap --topics /tf --json | head -n 10

mcap doctor test.mcap
mcap info test.mcap

mcap list attachments test.mcap
mcap list channels test.mcap
mcap list chunks test.mcap
mcap list metadata test.mcap
mcap list schemas test.mcap

# 切割
mcap filter bags_1.mcap -o bags_1.split.mcap -s 1706184169 -e 1706184199

# 合并
mcap merge mouse01.mcap mouse02.mcap -o mouse03.mcap
```

