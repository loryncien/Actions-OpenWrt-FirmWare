#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source and Add a feed source
# 使用源码自带ShadowSocksR Plus+出国软件
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#sed -i '$a src-git lienol https://github.com/xiaorouji/openwrt-package;master' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default

#添加自定义插件链接
git clone https://github.com/Lienol/openwrt-package package/lienol-packages
git clone https://github.com/siropboy/sirpdboy-package package/sirpdboy-package
#git clone https://github.com/kenzok8/openwrt-packages package/kenzok8-package

#添加自定义插件
echo '下载 openclash'
git clone -b master https://github.com/vernesong/OpenClash.git package/openwrt-packages/luci-app-openclash

echo '下载 luci-app-sqm'
#svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-sqm package/openwrt-packages/luci-app-sqm
#svn co https://github.com/openwrt/luci/trunk/applications/luci-app-sqm package/openwrt-packages/luci-app-sqm
sed -i 's/"control"/"network"/g' package/sirpdboy-package/luci-app-sqm/luasrc/controller/sqm.lua
echo '下载 sqm-scripts'
#svn co https://github.com/siropboy/sirpdboy-package/trunk/sqm-scripts package/openwrt-packages/sqm-scripts
svn co https://github.com/openwrt/packages/trunk/net/sqm-scripts package/openwrt-packages/sqm-scripts
rm -rf package/sirpdboy-package/sqm-scripts
sed -i 's/..\/..\/luci.mk/\$\(TOPDIR\)\/feeds\/luci\/luci.mk/g' package/sirpdboy-package/luci-app-nlbwmon/Makefile

echo '下载 ServerChan'
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
#echo '下载 kpr+'
#svn co https://github.com/siropboy/mypackages/trunk/luci-app-koolproxyR package/openwrt-packages/luci-app-koolproxyR
#git clone https://github.com/cnzd/luci-app-koolproxyR.git package/openwrt-packages/luci-app-koolproxyR
echo '下载 Dockerman'
git clone https://github.com/KFERMercer/luci-app-dockerman  package/openwrt-packages/luci-app-dockerman
echo '主题 infinityfreedom'
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/openwrt-packages/luci-theme-infinityfreedom
echo '主题 opentomato'
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-opentomato package/openwrt-packages/luci-theme-opentomato

#echo '下载koolddns'
#git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
#赋予koolddns权限
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
#chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns
