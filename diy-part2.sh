#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

#清理插件
rm -rf package/lean/luci-theme-argon

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# 文件管理中文乱码问题
sed -i 's/IOCHARSET="iso8859-1"/IOCHARSET="utf8"/g' target/linux/generic/config-5.4
# V2ray 4.27.5版本
#sed -i 's/VERSION:=.*$/VERSION:=4.27.5/g' package/lienol-packages/package/v2ray/Makefile
#sed -i 's/HASH:=.*$/HASH:=f289d8d85ab0851851a6e3c101226e77bed0052fd60f9185df8852b601e657f8/g' package/lienol-packages/package/v2ray/Makefile
#sed -i 's/VERSION:=.*$/VERSION:=1.4.2/g' package/lienol-packages/package/v2ray-plugin/Makefile
#sed -i 's/HASH:=.*$/HASH:=4da541c2a6548be24db68ed74ee117b757b6620a9b61b5960637a71f77ad438a/g' package/lienol-packages/package/v2ray-plugin/Makefile
#sed -i 's/VERSION:=.*$/VERSION:=4.27.5/g' package/lean/v2ray/Makefile
#sed -i 's/HASH:=.*$/HASH:=f289d8d85ab0851851a6e3c101226e77bed0052fd60f9185df8852b601e657f8/g' package/lean/v2ray/Makefile
#sed -i 's/VERSION:=.*$/VERSION:=1.4.2/g' package/lean/v2ray-plugin/Makefile
#sed -i 's/HASH:=.*$/HASH:=4da541c2a6548be24db68ed74ee117b757b6620a9b61b5960637a71f77ad438a/g' package/lean/v2ray-plugin/Makefile

#echo "DISTRIB_REVISION='S$(date +%Y.%m.%d) Ryan'" > ./package/base-files/files/etc/openwrt_release1

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-123'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
#sed -i "s/OpenWrt /281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改内核版本
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' target/linux/x86/Makefile
sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' target/linux/x86/Makefile
