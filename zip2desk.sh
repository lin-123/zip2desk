#!/bin/bash

# 压缩本地包并移动到桌面  zip2desk source target

# 打包后文件
SOURCE=${1:-'build'}

# 检测文件是否存在
check_file_and_exit() {
  local file_path=$1

  if [ ! -f "$file_path" ] && [ ! -d "$file_path" ]; then
    echo "文件 $file_path 不存在，终端即将退出"
    exit 1
  fi
}

check_file_and_exit ./package.json

VERSION=$(node --eval "console.log(require('./package.json').version);")
PKG_NAME=$(node --eval "console.log(require('./package.json').name);")

# 要压缩的文件
NAME=${2:-${PKG_NAME}}

tag=`date +%m%d%H%M`

ZIP_NAME=${NAME}.${VERSION}-${tag}.zip

check_file_and_exit $SOURCE
# npm run build
cp -r $SOURCE ${NAME}
zip -r ${ZIP_NAME} ${NAME}

if [ ! -d "~/Desktop/deploy" ]; then
  mkdir -p ~/Desktop/deploy
fi

mv ${ZIP_NAME} ~/Desktop/deploy
rm -rf ${NAME}

echo "All done."
echo "Remember to commit the changes to the master branch, in order to update the website."

# 用户选择是否回车打开此文件
read -p "Press Enter to open the file in Finder, or any other key to exit: " answer
if [ "$answer" = "" ]; then
  open -R ~/Desktop/deploy/$ZIP_NAME
fi