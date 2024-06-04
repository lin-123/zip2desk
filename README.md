# zip2desk

> 读取 package.json 中 name version -》 将本地打包后文件重命名 -》 压缩 -》 移动到桌面

## 快速上手

```sh
zip2desk [source] [target]
```
  -  source 源文件  默认 build 文件夹
  -  target 目标文件名  默认 package.json 中 name 字段
  -  输出路径： ~/Desktop/deploy/${target}.${version}-%m%d%H%M.zip
  -  version = package.josn 中 version 字段
