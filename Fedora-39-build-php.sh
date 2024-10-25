#!/bin/bash
echo -e "\nChecking that minimal requirements are ok"

# Ensure the OS is compatible with the launcher
OS="Fedora"
VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/fedora-release)
VER=${VERFULL:0:2} # return 34, 35 or 36
ARCH=$(uname -m)
mkdir -p /root/phpbuild/
cd /root/phpbuild/
wget --no-check-certificate https://www.php.net/distributions/php-7.4.33.tar.gz -O /root/phpbuild/php-7.4.33.tar.gz
rm -rf /root/phpbuild/php-7.4.33
tar -xvf /root/phpbuild/php-7.4.33.tar.gz
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.0.0-odbctimer.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.0.7-curl.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.2.0-includedir.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.2.0-libdb.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.2.0-oci8conf.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.3.3-systzdata-v19.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.0-embed.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.0-httpd.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.0-ldap_r.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.0-phpize.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.20-argon2.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.26-openssl3.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.26-snmp.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.33-gcc14.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.33-libxml212.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.33-tests.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.33-zlib-tests.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-7.4.8-phpinfo.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-bug81740.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-bug81744.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-bug81746.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2023-0662.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2023-3247.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2023-3823.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2023-3824.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-2756.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-3096.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-5458.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-8925.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-8926.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-8927.patch
wget https://git.remirepo.net/cgit/rpms/scl-php74/php.git/plain/php-cve-2024-9026.patch
cd /root/phpbuild/php-7.4.33
patch -p1 < ../php-7.4.0-httpd.patch
patch -p1 < ../php-7.2.0-includedir.patch
patch -p1 < ../php-7.4.0-embed.patch
patch -p1 < ../php-7.4.33-libxml212.patch
patch -p1 < ../php-7.2.0-libdb.patch
patch -p1 < ../php-7.4.33-gcc14.patch
patch -p1 < ../php-7.3.3-systzdata-v19.patch
patch -p1 < ../php-7.4.0-phpize.patch
sed -e 's/php-devel/%{?scl_prefix}php-devel/' -i scripts/phpize.in
patch -p1 < ../php-7.4.0-ldap_r.patch
patch -p1 < ../php-7.4.20-argon2.patch
patch -p1 < ../php-7.4.8-phpinfo.patch
patch -p1 < ../php-7.4.26-snmp.patch
patch -p1 < ../php-7.4.26-openssl3.patch
rm ext/openssl/tests/p12_with_extra_certs.p12
patch -p1 < ../php-7.2.0-oci8conf.patch
patch -p1 < ../php-bug81740.patch
patch -p1 < ../php-bug81744.patch
patch -p1 < ../php-bug81746.patch
patch -p1 < ../php-cve-2023-0662.patch
patch -p1 < ../php-cve-2023-3247.patch
patch -p1 < ../php-cve-2023-3823.patch
patch -p1 < ../php-cve-2023-3824.patch
patch -p1 < ../php-cve-2024-2756.patch
patch -p1 < ../php-cve-2024-3096.patch
patch -p1 < ../php-cve-2024-5458.patch
patch -p1 < ../php-cve-2024-8925.patch
patch -p1 < ../php-cve-2024-8926.patch
patch -p1 < ../php-cve-2024-8927.patch
patch -p1 < ../php-cve-2024-9026.patch
patch -p1 < ../php-7.0.10-datetests.patch
patch -p1 < ../php-7.4.33-tests.patch
patch -p1 < ../php-7.4.33-zlib-tests.patch
# ----- Manage known as failed test -------
# affected by systzdata patch
rm ext/date/tests/timezone_location_get.phpt
%if 0%{?fedora} < 28
# need tzdata 2018i
rm ext/date/tests/bug33414-1.phpt
rm ext/date/tests/date_modify-1.phpt
%endif
rm ext/date/tests/bug33415-2.phpt
# too fast builder
rm ext/date/tests/bug73837.phpt
# fails sometime
rm ext/sockets/tests/mcast_ipv?_recv.phpt
# Should be skipped but fails sometime
rm ext/standard/tests/file/file_get_contents_error001.phpt
# cause stack exhausion
rm Zend/tests/bug54268.phpt
rm Zend/tests/bug68412.phpt
# slow and erratic result
rm sapi/cli/tests/upload_2G.phpt
# tar issue
rm ext/zlib/tests/004-mb.phpt
# https://bugs.php.net/63362 - Not needed but installed headers.
# Drop some Windows specific headers to avoid installation,
# before build to ensure they are really not needed.
rm -f TSRM/tsrm_win32.h \
      TSRM/tsrm_config.w32.h \
      Zend/zend_config.w32.h \
      ext/mysqlnd/config-win.h \
      ext/standard/winver.h \
      main/win32_internal_function_disabled.h \
      main/win95nt.h

# Fix some bogus permissions
find . -name \*.[ch] -exec chmod 644 {} \;
chmod 644 README.*
# Force use of system libtool:
libtoolize --force --copy
cat $(aclocal --print-ac-dir)/{libtool,ltoptions,ltsugar,ltversion,lt~obsolete}.m4 >build/libtool.m4
# Regenerate configure scripts (patches change config.m4's)
touch configure.ac
./buildconf --force
'./configure' '--prefix=/home/xui/bin/php' '--with-fpm-user=xui' '--with-fpm-group=xui' '--enable-gd' '--with-jpeg' '--with-freetype' '--enable-static' '--disable-shared' '--enable-opcache' '--enable-fpm' '--without-sqlite3' '--without-pdo-sqlite' '--enable-mysqlnd' '--with-mysqli' '--with-curl' '--disable-cgi' '--with-zlib' '--enable-sockets' '--with-openssl' '--enable-shmop' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--enable-calendar' '--disable-rpath' '--enable-inline-optimization' '--enable-pcntl' '--enable-mbregex' '--enable-exif' '--enable-bcmath' '--with-mhash' '--with-gettext' '--with-xmlrpc' '--with-xsl' '--with-libxml' '--with-pdo-mysql' '--disable-mbregex'
#'./configure'  '--prefix=/home/xui/bin/php' '--with-zlib-dir' '--with-freetype-dir' '--enable-mbstring' '--enable-calendar' '--with-curl' '--with-gd' '--disable-rpath' '--enable-inline-optimization' '--with-bz2' '--with-zlib' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-pcntl' '--enable-mbregex' '--enable-exif' '--enable-bcmath' '--with-mhash' '--enable-zip' '--with-pcre-regex' '--with-pdo-mysql=mysqlnd' '--with-mysqli=mysqlnd' '--with-openssl' '--with-fpm-user=xtreamcodes' '--with-fpm-group=xtreamcodes' '--with-libdir=/lib/x86_64-linux-gnu' '--with-gettext' '--with-xmlrpc' '--with-xsl' '--enable-opcache' '--enable-fpm' '--enable-libxml' '--enable-static' '--disable-shared' '--with-jpeg-dir' '--enable-gd-jis-conv' '--with-webp-dir' '--with-xpm-dir'
make -j$(nproc --all)
killall php
killall php-fpm
killall php
killall php-fpm
killall php
killall php-fpm
chattr -i /home/xui/bin/php/sbin/php-fpm
chattr -i /home/xui/bin/php/bin/php
make install
cd /root
rm -rf /root/phpbuild/
chattr +i /home/xui/bin/php/sbin/php-fpm
chattr +i /home/xui/bin/php/bin/php
