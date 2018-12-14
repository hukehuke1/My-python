#!/bin/bash
#执行脚本前，将rm命令写入到/usr/local/yunsuo_agent/sec_policy/shellcmd.audit，顺便测试命令审计
#二进制文件保存路径/opt/elf/
#用到的命令复制到/opt/elf/
#做删除操作前文件备份路径/opt/bak/
#输出日志/opt/xtjg.log
#所有进程执行的当前目录/opt/elf/
#执行脚本前，需要准备/opt/elf文件夹，文件夹中应该有vi、wget、touch、liblogin_restrict_linux.so等elf文件



#在/opt/elf文件夹中创建vi、wget、touch、liblogin_restrict_linux.so
#在所有用到系统文件。比如/bin/vi这类的文件时，先判断有没有该文件，如果没有，创建一个
cd /opt/
if [ ! -d "/opt/elf/" ]; then   #判断如果没有文件夹的话，创建文件夹
 mkdir "/opt/elf/"
fi
if [ ! -d "/opt/bak/" ]; then
 mkdir "/opt/bak/"
fi
if [ ! -f "/opt/xtjg.log" ]; then  #判断如果没有文件的话，创建文件
 touch /opt/xtjg.log
fi
if [ ! -f "/etc/bashrc" ]; then  #判断如果没有文件的话，创建文件
 touch /etc/bashrc
fi
if [ ! -f "/etc/inittab" ]; then  #判断如果没有文件的话，创建文件
 touch /etc/inittab
fi
if [ ! -f "/etc/zshrc" ]; then  #判断如果没有文件的话，创建文件
 touch /etc/zshrc
fi

cp /usr/bin/vi /opt/elf/
cd /opt/elf/
#将用到的命令重命名为不信任进程的名字
dd if=/bin/cp of=/opt/elf/java
dd if=/bin/mv of=/opt/elf/httpd
dd if=/bin/echo of=/opt/elf/nginx
dd if=/bin/mkdir of=/opt/elf/mysqld
dd if=/bin/rm of=/opt/elf/apache2
dd if=/bin/touch of=/opt/elf/php
chmod 777 /opt/elf/java
chmod 777 /opt/elf/httpd
chmod 777 /opt/elf/nginx
chmod 777 /opt/elf/apache2
chmod 777 /opt/elf/mysqld
chmod 777 /opt/elf/php
cp /usr/bin/ssh /opt/elf/wget
cp /usr/bin/ssh /opt/elf/vi
cp /usr/bin/ssh /opt/elf/touch
cp /usr/bin/ssh /opt/elf/liblogin_restrict_linux.so
#01/bin目录创建隐藏文件夹
echo "#01/bin目录创建隐藏文件夹" >> /opt/xtjg.log
/opt/elf/mysqld /bin/.test>> /opt/xtjg.log 2>&1
rm -rf /bin/.test
#02bin和lib目录下elf文件重命名，当前目录下存在二进制文件vi、wget、touch、liblogin_restrict_linux.so
echo "#02bin和lib目录下elf文件重命名" >> /opt/xtjg.log
cp /opt/elf/vi /bin/vi >> /opt/xtjg.log 2>&1    
cp /opt/elf/vi /lib/vi >> /opt/xtjg.log 2>&1
/opt/elf/httpd /bin/vi /bin/testvi >> /opt/xtjg.log 2>&1
/opt/elf/httpd /lib/vi /lib/testvi >> /opt/xtjg.log 2>&1
#删除测试文件
rm -rf /bin/testvi /bin/vi
rm -rf /lib/testvi /lib/vi
#03创建密码文件软连接
echo "#03创建密码文件软连接" >> /opt/xtjg.log
ln -s /etc/passwd /root/passwd >> /opt/xtjg.log 2>&1
ln -s /etc/shadow /root/shadow >> /opt/xtjg.log 2>&1
#04不信任进程隐藏elf文件    todo 此项case不生效。拷贝一直是成功的
echo "#04不信任进程隐藏elf文件" >> /opt/xtjg.log
./httpd /opt/elf/wget /opt/.wget >> /opt/xtjg.log 2>&1
#05阻止以下情况执行进程 文件在/dev/shm或者/run/shm下
echo "#05启动进程，/dev/shm,/run/shm目录里的进程" >> /opt/xtjg.log
cp /bin/ls /dev/shm/ls 
/dev/shm/ls 2>> /opt/xtjg.log
mkdir /run/
mkdir /run/shm/
cp /bin/ls /run/shm/ls  #ls无法拷贝进去？ todo
/run/shm/ls 2>> /opt/xtjg.log 
# # 06启动进程，不信任进程，执行gcc
# echo "#06启动进程，不信任进程，执行gcc" >> /opt/log
# #/opt/elf/mysqld
# gcc -v >> /opt/xtjg.log 2>&1
#07web进程、数据库进程创建elf文件(对外服务进程创建可执行文件  SEVT_CREATE_EXEC_FILE)
echo "#07不信任进程创建elf文件" >> /opt/xtjg.log   #无法创建成功，但是无反馈
/opt/elf/java /opt/elf/liblogin_restrict_linux.so /opt/elf/liblogin_restrict_linux.bak.so >> /opt/xtjg.log 2>&1
if [ ! -f "/opt/elf/liblogin_restrict_linux.bak.so" ]; then  #判断如果没有文件的话，输出log
 echo "pass">> /opt/xtjg.log 2>&1
fi
#08程序自我复制
echo "#08程序自我复制" >> /opt/xtjg.log
/bin/cp /bin/cp /opt/cpself >> /opt/xtjg.log 2>&1
if [ ! -f "/opt/cpself" ]; then  #判断如果没有文件的话，输出log
 echo "pass">> /opt/xtjg.log 2>&1
fi
#09不信任进程在/tmp、/var/tmp、/dev/shm、/run/shm/目录下创建elf文件，告警不拦截 
echo "#09不信任进程在/tmp、/var/tmp、/dev/shm、/run/shm/目录下创建elf文件，告警不拦截" >> /opt/xtjg.log
/opt/elf/java /opt/elf/liblogin_restrict_linux.so /tmp/ >> /opt/xtjg.log 2>&1
if [ ! -f "/tmp/liblogin_restrict_linux.so" ]; then  #判断如果没有文件的话，输出log
 echo "pass1">> /opt/xtjg.log 2>&1
fi
/opt/elf/java /opt/elf/liblogin_restrict_linux.so /var/tmp/ >> /opt/xtjg.log 2>&1
if [ ! -f "/var/tmp/liblogin_restrict_linux.so" ]; then  #判断如果没有文件的话，输出log
 echo "pass2">> /opt/xtjg.log 2>&1
fi
/opt/elf/java /opt/elf/touch /dev/shm/ >> /opt/xtjg.log 2>&1    #case无法通过 todo
if [ ! -f "/dev/shm/touch" ]; then  #判断如果没有文件的话，输出log
 echo "pass3">> /opt/xtjg.log 2>&1
fi
/opt/elf/java /opt/elf/touch /run/shm/ >> /opt/xtjg.log 2>&1
if [ ! -f "/run/shm/touch" ]; then  #判断如果没有文件的话，输出log
 echo "pass4">> /opt/xtjg.log 2>&1
fi
#10添加系统启动项
echo "#10添加系统启动项" >> /opt/xtjg.log
touch /etc/init.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc0.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc1.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc2.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc3.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc4.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc5.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc6.d/test >> /opt/xtjg.log 2>&1
#11不信任进程创建、修改免密码登录文件：authorized_keys
echo "#11不信任进程创建、修改免密码登录文件：authorized_keys" >> /opt/xtjg.log
mkdir /root/.ssh/
#/opt/elf/java /opt/elf/authorized_keys /root/.ssh/ >> /opt/xtjg.log 2>&1          #不信任进程创建免密码登录文件
#cp /opt/elf/authorized_keys /root/.ssh/ >> /opt/xtjg.log 2>&1
#/opt/elf/nginx aaa >> /root/.ssh/authorized_keys >> /opt/xtjg.log 2>&1        /.ssh/这个是啥意思？
#12创建定时任务脚本,告警不拦截
echo "#12创建定时任务脚本,告警不拦截" >> /opt/xtjg.log
/opt/elf/php /var/spool/cron/tom  >> /opt/xtjg.log 2>&1
/opt/elf/php /etc/cron.d/abc  >> /opt/xtjg.log 2>&1
#13所有进程修改boot目录下的文件
echo "#13所有进程修改boot目录下的文件" >> /opt/xtjg.log
touch /boot/test 
/opt/elf/nginx aaa >> /boot/test 2>> /opt/xtjg.log
echo aaa >> /boot/test 2>> /opt/xtjg.log
#14所有进程删除boot目录下的文件
echo "#14所有进程删除boot目录下的文件" >> /opt/xtjg.log
rm -rf /boot/test >> /opt/xtjg.log 2>&1
#15不信任进程修改/etc/passwd和/etc/shadow
echo "#15不信任进程修改/etc/passwd和/etc/shadow" >> /opt/xtjg.log
/opt/elf/nginx aaa >> /etc/passwd 2>> /opt/xtjg.log
/opt/elf/nginx aaa >> /etc/shadow 2>> /opt/xtjg.log
#16所有进程修改/etc/pam.d/下的文件
echo "#16所有进程修改/etc/pam.d/下的文件" >> /opt/xtjg.log
touch /etc/pam.d/test
/opt/elf/nginx aaa >> /etc/pam.d/test 2>> /opt/xtjg.log
rm -rf /etc/pam.d/test >> /opt/xtjg.log 2>&1
#17所有进程修改/bin、/lib目录下的elf文件
echo "#17所有进程修改/bin、/lib目录下的elf文件" >> /opt/xtjg.log
cp /opt/elf/liblogin_restrict_linux.so /bin/ 2>> /opt/xtjg.log    
cp /opt/elf/liblogin_restrict_linux.so /lib/ 2>> /opt/xtjg.log
echo aaa >> /bin/liblogin_restrict_linux.so 2>> /opt/xtjg.log
echo aaa >> /lib/liblogin_restrict_linux.so 2>> /opt/xtjg.log
/opt/elf/nginx aaa >> /bin/liblogin_restrict_linux.so 2>> /opt/xtjg.log
/opt/elf/nginx aaa >> /lib/liblogin_restrict_linux.so 2>> /opt/xtjg.log
rm -rf /bin/liblogin_restrict_linux.so >> /opt/xtjg.log 2>&1
rm -rf /lib/lib/liblogin_restrict_linux.so >> /opt/xtjg.log 2>&1
#18不信任进程修改文件
echo "#18不信任进程修改文件" >> /opt/xtjg.log
/opt/elf/httpd /etc/profile /etc/profile.bak 2>> /opt/xtjg.log
/opt/elf/nginx aaa >> /etc/profile 2>> /opt/xtjg.log
touch /etc/profile.d/test
/opt/elf/nginx aaa >> /etc/profile.d/test 2>> /opt/xtjg.log
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
/opt/elf/nginx aaa >> /etc/ssh/ssh_config 2>> /opt/xtjg.log   #这一项可以通过？ todo
cp /etc/syslog.conf /etc/syslog.conf.bak
/opt/elf/nginx aaa >> /etc/syslog.conf 2>> /opt/xtjg.log
cp /etc/bashrc /etc/bashrc.bak
/opt/elf/nginx aaa >> /etc/bashrc 2>> /opt/xtjg.log
cp /etc/inittab /etc/inittab.bak
/opt/elf/nginx aaa >> /etc/inittab 2>> /opt/xtjg.log
cp /etc/ashrc /etc/ashrc.bak
/opt/elf/nginx aaa >> /etc/ashrc 2>> /opt/xtjg.log   #这一项可以通过？ todo
#19所有进程删除文件，/etc/passwd、/etc/shadow
echo "#19所有进程删除文件，/etc/passwd、/etc/shadow" >> /opt/xtjg.log
cp /etc/passwd /etc/passwd.bak
cp /etc/shadow /etc/shadow.bak
rm -rf /etc/passwd >> /opt/xtjg.log 2>&1
rm -rf /etc/shadow >> /opt/xtjg.log 2>&1
#20不信任进程删除文件，/etc/profile, /etc/profile.d/*, /etc/ssh/sshd_config,/etc/syslog.conf, /etc/bashrc ,/etc/inittab, /etc/zshrc,/etc/hosts
echo "#20不信任进程删除文件" >> /opt/xtjg.log
cp /etc/profile /opt/bak/profile
cp -a /etc/profile.d/ /opt/bak/profile.d/ 
cp -a /etc/ssh/ssh_config /opt/bak/
cp /etc/syslog.conf /opt/bak/
cp /etc/bashrc /opt/bak/
cp /etc/inittab /opt/bak/
cp /etc/zshrc /opt/bak/
#cp /etc/hosts /opt/bak/
/opt/elf/apache2 -rf /etc/profile >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/profile.d/* >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/ssh/sshd_config >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/syslog.conf >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/bashrc >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/inittab >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/zshrc >> /opt/xtjg.log 2>&1
#opt/elf/apache2 -rf /etc/hosts >> /opt/xtjg.log 2>&1
#21所有进程删除/etc/pam.d/下的文件
echo "#21所有进程删除/etc/pam.d/下的文件" >> /opt/xtjg.log
#cp -a /etc/pam.d/ /opt/bak/  如果没有/etc/pam.d这个文件夹呢？todo 
rm -rf /etc/pamd.d/ >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/pam.d/ >> /opt/xtjg.log 2>&1
#22非正常目录下创建elf文件,/tmp/,/var/tmp/,告警不拦截
echo "#22非正常目录下创建elf文件,/tmp/,/var/tmp/,告警不拦截" >> /opt/xtjg.log
/opt/elf/java /opt/elf/vi /tmp/ >> /opt/xtjg.log 2>&1
if [ ! -f "/tmp/vi" ]; then  #判断如果没有文件的话，输出log
 echo "pass">> /opt/xtjg.log 2>&1
fi
/opt/elf/java /opt/elf/liblogin_restrict_linux.so /var/tmp/ >> /opt/xtjg.log 2>&1
if [ ! -f "/var/tmp/liblogin_restrict_linux.so" ]; then  #判断如果没有文件的话，输出log
 echo "pass">> /opt/xtjg.log 2>&1
fi
#23黑名单进程gcc、g++、ld、as、ar、objcopy、nasm、make、nc、netcat、nc.openbsd、socat,只要测试一个命令即可
echo "#23黑名单进程执行命令" >> /opt/xtjg.log
#获取IP
ip=$(/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:" ) 
filename=${ip}".log"
#ftp上传，上传到127上
ftp -n<<!
open 192.168.1.127
user test 1
cd geyytest/logs
lcd /opt/
put xtjg.log $filename