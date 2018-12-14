#!/bin/bash
current=`date "+%Y-%m-%d %H:%M:%S"`
timeStamp=`date -d "$current" +%s` #将current转换为时间戳，精确到毫秒
currentTimeStamp=$((timeStamp*1000+`date "+%N"`/1000000))
echo $current


#echo  "$(date) cpu used $cpuUsed% "  >>/opt/press.log 2>&1



# press
function press()
{
    #页面02
    cp /opt/elf/liblogin_restrict_linux.so /bin/
    cp /opt/elf/liblogin_restrict_linux.so /lib/
    echo aaa >> /bin/liblogin_restrict_linux.so
    echo aaa >> /lib/liblogin_restrict_linux.so
    /opt/elf/nginx aaa >> /bin/liblogin_restrict_linux.so
    /opt/elf/nginx aaa >> /lib/liblogin_restrict_linux.so
    rm -rf /bin/liblogin_restrict_linux.so
    rm -rf /lib/lib/liblogin_restrict_linux.so
#cp -a /etc/pam.d/ /opt/bak/  如果没有/etc/pam.d这个文件夹呢？todo 
rm -rf /etc/pamd.d/
/opt/elf/apache2 -rf /etc/pam.d/
#页面05 禁止更改系统引导文件 old14所有进程删除boot目录下的文件
rm -rf /boot/test
#页面06 禁止添加系统启动项 old10添加系统启动项
echo "#06添加系统启动项"
touch /etc/init.d/test
touch /etc/rc0.d/test
touch /etc/rc1.d/test
touch /etc/rc2.d/test
touch /etc/rc3.d/test
touch /etc/rc4.d/test
touch /etc/rc5.d/test
touch /etc/rc6.d/test
#页面07 禁止对外服务进程添加定时任务  old12创建定时任务脚本
/opt/elf/php /var/spool/cron/tom
/opt/elf/php /etc/cron.d/abc
#页面09 禁止进程自我修复  old 08程序自我复制
/bin/cp /bin/cp /opt/cpself
#页面10 禁止对外服务进程修改系统日志
cp -R /root/.bash_history /opt/elf/.bash_history.bak
/opt/elf/apache2 -rf /root/.bash_history
cp -R /opt/elf/.bash_history.bak /root/.bash_history  

#页面13 禁止在BIN目录下面创建隐藏文件夹  old 01/bin目录创建隐藏文件夹
/opt/elf/mysqld /bin/.test
rm -rf /bin/.test 

#14禁止创建密码文件的符号链接 old03创建密码文件软连接
ln -s /etc/passwd /root/passwd
ln -s /etc/shadow /root/shadow

#20禁止对外服务进程修改SSH永久认证文件  11不信任进程创建、修改免密码登录文件：authorized_keys
if [ ! -d "/root/.ssh/" ]; then   #判断如果没有文件夹的话，创建文件夹
mkdir "/root/.ssh/"
fi
if [ ! -f "opt/elf/authorized_keys" ]; then   #判断如果没有文件夹的话，创建文件夹
touch "/opt/elf/authorized_keys"
fi
touch /opt/elf/authorized_keys
/opt/elf/java /opt/elf/authorized_keys /root/.ssh/authorized_keys

#21  old 05阻止以下情况执行进程 文件在/dev/shm或者/run/shm下
echo "#21启动进程，/dev/shm,/run/shm目录里的进程"
cp /bin/ls /dev/shm/ls 
/dev/shm/ls
mkdir /run/
mkdir /run/shm/
cp /bin/ls /run/shm/ls  #ls无法拷贝进去？ todo
/run/shm/ls

#22 对外服务进程执行危险命令 old07web进程、数据库进程创建elf文件(对外服务进程创建可执行文件  SEVT_CREATE_EXEC_FILE) 
/opt/elf/java /opt/elf/liblogin_restrict_linux.so /opt/elf/liblogin_restrict_linux.bak.so
cp /etc/profile /opt/bak/profile
cp -a /etc/profile.d/ /opt/bak/profile.d/ 
cp -a /etc/ssh/ssh_config /opt/bak/
cp /etc/syslog.conf /opt/bak/
cp /etc/bashrc /opt/bak/
cp /etc/inittab /opt/bak/
cp /etc/zshrc /opt/bak/
#cp /etc/hosts /opt/bak/
/opt/elf/apache2 -rf /etc/profile
/opt/elf/apache2 -rf /etc/profile.d/*
/opt/elf/apache2 -rf /etc/ssh/sshd_config
/opt/elf/apache2 -rf /etc/syslog.conf
/opt/elf/apache2 -rf /etc/bashrc
/opt/elf/apache2 -rf /etc/inittab
/opt/elf/apache2 -rf /etc/zshrc
#opt/elf/apache2 -rf /etc/hosts  
}




function prepare()
{
    cd /opt/
    if [ ! -d "/opt/elf/" ]; then   #判断如果没有文件夹的话，创建文件夹
    mkdir "/opt/elf/"
    fi
    if [ ! -d "/opt/bak/" ]; then
    mkdir "/opt/bak/"
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
}

######################################################
prepare
while true
do 
    press
    cpuUsed=$(ps -aux|grep _agent_service |grep -v grep |awk '{print $3}')
    echo  "$(date) Agent cpu used $cpuUsed% "  >>/opt/press.log 2>&1
    sleep 5
done