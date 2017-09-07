#########################################################################
# File Name: test.sh
# Author: jinlin
# mail:898141731@qq .com
# Created Time: Tuesday, August 29, 2017 PM09:28:36 HKT
#########################################################################
#!/bin/bash

pippath=".pip"
vimrc=".vimrc"
git=".gitconfig"

#-f 判断变量是否存在
if [ ! -f ~/"$pippath"/pip.conf ]; then
    #-x判断变量是否存在且具有执行权限
    if [ ! -d ~/"$pippath" ]; then
        mkdir ~/"$pippath"
    else
        echo "文件夹存在，即将创建文件"
    fi
    cp pip.conf ~/"$pippath"/
    echo "copping pip.conf to ~/.pip/pip.conf"
else
    echo "pip.conf文件已经存在，请确认！"
fi

if [ ! -f ~/"$vimrc" ]; then
    echo "cp .vimrc ~/.vimrc"
    cp .vimrc ~/"$vimrc"
else
    echo ".vimrc文件已经存在，请先确认了再执行脚本！"
fi

if [ ! -f ~/"$git" ]; then
    echo "cp .gitconfig ~/.gitconfig"
    cp .gitconfig ~/"$git"
    echo "请输入你git的用户名："
    read name
    echo "请输入你git的邮箱地址："
    read email
    if [ -n $name -a -n $email ]; then
        #打开反斜杠转义
        printf "\n[user]\n\tname = $name\n\temail = $email" >> ~/"$git"
    else
        echo "输入无效，请自行添加git账户和邮箱！"
    fi
else
    echo ".gitconfig文件已经存在，请先确认了再执行脚本！"
fi
