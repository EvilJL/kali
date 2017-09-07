#!/bin/bash
pkg_name="sogoupinyin.deb"
pkg_url="http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb?st=nvYWDuFAIspH35BPsQh8EA&e=1504321129&fn=sogoupinyin_2.1.0.0086_amd64.deb"
pkg_dep="libopencc2 libopencc2-data fcitx fcitx-pinyin"
is_installed=`apt list sogoupinyin|grep installed`
if [ "$is_installed" = "" ]; then
        echo "即将安装搜狗输入法："
        sudo apt install $pkg_dep
        if [ ! -x "$pkg_name" ]; then
                axel  -q -o sogoupinyin.deb "$pkg_url" 
        else
                echo "$pkg_name exists!"
        fi
        while [ ! -x "$pkg_name" ]
        do 
                chmod +x "$pkg_name"
                sudo dpkg -i "$pkg_name"
                echo "done!"
        done
else
        echo "installed!"
fi 
