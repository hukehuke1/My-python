#!/bin/bash
#执行脚本前，将rm命令写入到/usr/local/yunsuo_agent/sec_policy/shellcmd.audit，顺便测试命令审计
#二进制文件保存路径/opt/elf/
#用到的命令复制到/opt/elf/
#做删除操作前文件备份路径/opt/bak/
#输出日志/opt/xtjg.log
#所有进程执行的当前目录/opt/elf/
#执行脚本前，需要准备/opt/elf文件夹，文件夹中应该有vi、wget、touch、liblogin_restrict_linux.so等elf文件

#预准备  在/opt/elf文件夹中创建vi、wget、touch、liblogin_restrict_linux.so
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




#01套接字？？？
#手工验证pass
echo "#01 套接字 手工验证" >> /opt/xtjg.log

#页面02 old17所有进程修改/bin、/lib目录下的elf文件
echo "#02所有进程修改/bin、/lib目录下的elf文件" >> /opt/xtjg.log
cp /opt/elf/liblogin_restrict_linux.so /bin/ 2>> /opt/xtjg.log    
cp /opt/elf/liblogin_restrict_linux.so /lib/ 2>> /opt/xtjg.log
echo aaa >> /bin/liblogin_restrict_linux.so 2>> /opt/xtjg.log
echo aaa >> /lib/liblogin_restrict_linux.so 2>> /opt/xtjg.log
/opt/elf/nginx aaa >> /bin/liblogin_restrict_linux.so 2>> /opt/xtjg.log
/opt/elf/nginx aaa >> /lib/liblogin_restrict_linux.so 2>> /opt/xtjg.log
rm -rf /bin/liblogin_restrict_linux.so >> /opt/xtjg.log 2>&1
rm -rf /lib/lib/liblogin_restrict_linux.so >> /opt/xtjg.log 2>&1

#页面03 禁止对外服务进程更改linux系统配置文件  old20不信任进程删除文件，/etc/profile, /etc/profile.d/*, /etc/ssh/sshd_config,/etc/syslog.conf, /etc/bashrc ,/etc/inittab, /etc/zshrc,/etc/hosts
echo "#03不信任进程删除文件" >> /opt/xtjg.log
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



#页面04 禁止更改系统PAM文件  old 21所有进程删除/etc/pam.d/下的文件
echo "#04所有进程删除/etc/pam.d/下的文件" >> /opt/xtjg.log
#cp -a /etc/pam.d/ /opt/bak/  如果没有/etc/pam.d这个文件夹呢？todo 
rm -rf /etc/pamd.d/ >> /opt/xtjg.log 2>&1
/opt/elf/apache2 -rf /etc/pam.d/ >> /opt/xtjg.log 2>&1

#页面05 禁止更改系统引导文件 old14所有进程删除boot目录下的文件
echo "#05所有进程删除boot目录下的文件" >> /opt/xtjg.log
rm -rf /boot/test >> /opt/xtjg.log 2>&1

#页面06 禁止添加系统启动项 old10添加系统启动项
echo "#06添加系统启动项" >> /opt/xtjg.log
touch /etc/init.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc0.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc1.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc2.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc3.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc4.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc5.d/test >> /opt/xtjg.log 2>&1
touch /etc/rc6.d/test >> /opt/xtjg.log 2>&1

#页面07 禁止对外服务进程添加定时任务  old12创建定时任务脚本
echo "#07创建定时任务脚本,告警不拦截" >> /opt/xtjg.log
/opt/elf/php /var/spool/cron/tom  >> /opt/xtjg.log 2>&1
/opt/elf/php /etc/cron.d/abc  >> /opt/xtjg.log 2>&1

#页面08 反连shell 
#手工验证pass
echo "#08 反连shell 手工验证" >> /opt/xtjg.log

#页面09 禁止进程自我修复  old 08程序自我复制
echo "#09程序自我复制" >> /opt/xtjg.log
/bin/cp /bin/cp /opt/cpself >> /opt/xtjg.log 2>&1
if [ ! -f "/opt/cpself" ]; then  #判断如果没有文件的话，输出log
 echo "pass">> /opt/xtjg.log 2>&1
fi

#页面10 禁止对外服务进程修改系统日志
echo "#10 禁止对外服务进程修改系统日志" >> /opt/xtjg.log
cp -R /root/.bash_history /opt/elf/.bash_history.bak
/opt/elf/apache2 -rf /root/.bash_history  >> /opt/xtjg.log 2>&1
cp -R /opt/elf/.bash_history.bak /root/.bash_history  



#页面11  禁止对外服务进程运行隐藏的进程
#todo  /usr/bin/.ls 

#页面12  禁止对外服务进程创建危险的定时任务脚本
#todo
#页面13 禁止在BIN目录下面创建隐藏文件夹  old 01/bin目录创建隐藏文件夹
echo "#13/bin目录创建隐藏文件夹" >> /opt/xtjg.log
/opt/elf/mysqld /bin/.test>> /opt/xtjg.log 2>&1
rm -rf /bin/.test 

#14禁止创建密码文件的符号链接 old03创建密码文件软连接
echo "#14创建密码文件软连接" >> /opt/xtjg.log
ln -s /etc/passwd /root/passwd >> /opt/xtjg.log 2>&1
ln -s /etc/shadow /root/shadow >> /opt/xtjg.log 2>&1

#15 禁止对外服务进程在/dev/shm/下创建可执行文件 
#todo  /opt/elf/java /bin/ls /dev/shm/ls 没有日志 执行之后应该没有/dev/shm/ls的文件  ？todo

#16 禁止对外服务进程编译.c文件
#手工验证 pass
echo "#16禁止对外服务进程编译.c文件 手工验证" >> /opt/xtjg.log

#17 netcate进程创建shell
#手工验证pass  nc -l 1234
echo "#17 netcate进程创建shell 手工验证" >> /opt/xtjg.log

#18 netcat进程访问(读,写)管道
#手工验证pass
echo "#18netcat进程访问(读,写)管道 手工验证" >> /opt/xtjg.log
#19 dd进程读写socket类型文件
#todo没看懂
echo "#19dd进程读写socket类型文件 " >> /opt/xtjg.log

#20禁止对外服务进程修改SSH永久认证文件  11不信任进程创建、修改免密码登录文件：authorized_keys
echo "#20不信任进程创建、修改免密码登录文件：authorized_keys" >> /opt/xtjg.log
mkdir /root/.ssh/
touch /opt/elf/authorized_keys
/opt/elf/java /opt/elf/authorized_keys /root/.ssh/authorized_keys >> /opt/xtjg.log 2>&1          #不信任进程创建免密码登录文件


#21  old 05阻止以下情况执行进程 文件在/dev/shm或者/run/shm下
echo "#21启动进程，/dev/shm,/run/shm目录里的进程" >> /opt/xtjg.log
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

#22 对外服务进程执行危险命令 old07web进程、数据库进程创建elf文件(对外服务进程创建可执行文件  SEVT_CREATE_EXEC_FILE) 
echo "#22不信任进程创建elf文件" >> /opt/xtjg.log   #无法创建成功，但是无反馈
/opt/elf/java /opt/elf/liblogin_restrict_linux.so /opt/elf/liblogin_restrict_linux.bak.so >> /opt/xtjg.log 2>&1
if [ ! -f "/opt/elf/liblogin_restrict_linux.bak.so" ]; then  #判断如果没有文件的话，输出log
 echo "pass">> /opt/xtjg.log 2>&1
fi
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