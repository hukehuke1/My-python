此脚本为linux测试操作系统加固用的脚本。

前提条件：测试人员工作机上有python3.0+ 有D盘，linux测试服务器上有ftp wget，安装云锁，开启操作系统加固。
使用方式：
1.在测试机上执行： 
wget ftp://test:1@192.168.1.127/geyytest/sys-ver20181203.sh && chmod 755 sys-ver*.sh && ./sys-ver*.sh
执行脚本之后，会自动运行测试程序， ftp://test:1@192.168.1.127/geyytest/logs/中会生成一个以IP.log方式命名的测试结果文件。

先人工校验IP.log文件的准确性，校验方法是：有测试结果的case，要么测试结果里有permission denied，要么有pass，都没有的认为该条case不通过。
#2.在本地机上运行driver-test.py脚本，创建D:\data文件夹，把ftp://192.168.1.127/geyytest/logs/ 中的log文件都下载到文件夹中，进行处理，输出到IP+result.txt中





驱动压力测试脚本以及方法
/opt/目录下执行
wget ftp://test:1@192.168.1.127/geyytest/press.sh && chmod 755 press.sh&& ./press.sh
然后执行以下三步
ctrl+z 
bg
ctrl+d
此时脚本已经后台执行
验证测试结果观察/opt/press.log





脚本正在测试和调试中，有任何问题找我      胡珂 20181203

