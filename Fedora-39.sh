#!/bin/bash
echo -e "\nChecking that minimal requirements are ok"

# Ensure the OS is compatible with the launcher
 OS="Fedora"
VERFULL="$(sed 's/^.*release //;s/ (Fin.*$//' /etc/fedora-release)"
VER="${VERFULL:0:2}" # return 38, 39 or 40
ARCH=$(uname -m)
echo "Detected : $OS  $VER  $ARCH"
dnf -y install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
dnf -y install --nogpgcheck https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm

dnf -y install MariaDB-server
cd /root
wget https://github.com/jua74470/xui.one/raw/refs/heads/master/php74.spec -O php74.spec
dnf -y remove libcurl-devel
dnf -y build-dep php74.spec
wget https://github.com/amidevous/xui.one/releases/download/test/XUI_1.5.13.zip -qO XUI_1.5.13.zip >/dev/null 2>&1
unzip XUI_1.5.13.zip >/dev/null 2>&1
rm -rf XUI_1.5.13.zip
wget https://github.com/jua74470/xui.one/raw/refs/heads/master/Fedora-39.python3 -qO Fedora-39.python3 >/dev/null 2>&1
python3 /root/Fedora-39.python3
