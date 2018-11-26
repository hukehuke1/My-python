# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   File Name：     driver-test.py
   Description :   从127上下载log文件并且分析
   Author :       huke
   date：          2018/9/25
-------------------------------------------------
   Change Activity:
                   2018/9/25:
-------------------------------------------------
"""
from ftplib import FTP
import os

def ftpconnect(host, username, password):
    ftp = FTP() 
    ftp.connect(host, 21) 
    ftp.login(username, password) 
    return ftp

def downloadfile(ftp, remotepath, localpath): 
    bufsize = 1024 
    fp = open(localpath, 'wb')  #打开要保存的本地文件
    ftp.retrbinary('RETR '+remotepath, fp.write, bufsize)   #拼接RETR +path字符串，RETR后边要加空格，
    ftp.set_debuglevel(0) 
    fp.close()

def getfiles(ip,port,user,passwd):
    ftp = FTP()
    ftp.set_debuglevel(2)
    ftp.connect(ip,port)
    #ftp.connect("192.168.1.127",21)
    ftp.login(user,passwd)
    #ftp.login('test','1')
    print(ftp.getwelcome())
    ftp.cwd('geyytest/logs')
    fileList = []
    fileList = ftp.nlst()
    #对filelist的每个文件循环：下载，解析。
    for i in fileList:
        pass


def readfiles(path):
    with open(path, 'r',encoding = 'utf8') as f:  #如果不加encoding的话，系统默认用gbk解码，会出现错误
        line = [] #文件的每行读入
        case = [] #每个list对应一个case的文件
        line = f.readlines()
        k = 0  #设定一个计数器 第k个case对应的就是case号
        singleCase = ""
        for i in line:
            if i.startswith("#01"):   #第一个行处理规则
                k += 1
                singleCase = i  #第一个case的第一行
            elif i.startswith("#"):    #后面的#行处理规则
                case.append(singleCase)  #把前一个case写入case的list
                k += 1   #发现#后，计数器+1
                singleCase = i  #新的case第一行
            else:
                singleCase = singleCase + " " + i  #如果不是以#开始的，那就字符串拼接起来。然后继续处理下一行
        # l = 1
        # for i in case:
        #     print(l,i)
        #     l += 1

        # #此时case[n]对应的就是第n+1个case的内容

        l = 1
        with open(path+'result.txt','w') as fr: # 把输出结果写入文件
            fr.write("驱动测试脚本结果")
            for i in case:
                if i.startswith("#01"):  #包含Permission denied认为case通过
                    if (i.find("Permission denied") != -1): #包含Permission denied
                        fr.write("##01通过\n")
                    else:
                        fr.write("##01未通过\n")
                        fr.write(i)
                elif i.startswith("#02"):
                    if (i.count("Permission denied") == 2):  #如果包含两个Permission denied  视为case通过
                        fr.write("##02通过\n")
                    else:
                        fr.write("##02未通过\n")
                        fr.write(i)
                elif i.startswith("#03"):
                    if (i.count("Permission denied") == 2):  #如果包含两个Permission denied  视为case通过
                        fr.write("##03通过\n")
                    else:
                        fr.write("##03未通过\n")
                        fr.write(i)
                elif i.startswith("#04"):
                    if (i.count("Permission denied") == 1):  #如果包含1个Permission denied  视为case通过
                        fr.write("##04通过\n")
                    else:
                        fr.write("##04未通过\n")
                        fr.write(i)
                elif i.startswith("#05"):
                    if (i.count("Permission denied") == 1):  #如果包含1个Permission denied  视为case通过
                        fr.write("##05通过\n")
                    else:
                        fr.write("##05未通过\n")
                        fr.write(i)
                elif i.startswith("#06"):
                    fr.write("##06\n")
                    fr.write(i)
                elif i.startswith("#07"):
                    if (i.count("pass") == 1):  #如果包含1个pass  视为case通过
                        fr.write("##07通过\n")
                    else:
                        fr.write("##07未通过\n")
                        fr.write(i)
                elif i.startswith("#08"):
                    if (i.count("pass") == 1):  #如果包含1个pass  视为case通过
                        fr.write("##08通过\n")
                    else:
                        fr.write("##08未通过\n")
                        fr.write(i)
                elif i.startswith("#09"):
                    if ((i.count("pass1") == 1) and (i.count("pass2") == 1) and (i.count("pass3") == 1) and (i.count("pass4") == 1)):  #如果包含1个pass  视为case通过
                        fr.write("##08通过\n")
                    else:
                        fr.write("##08未通过\n")
                        fr.write(i)
                elif i.startswith("#10"):
                    if (i.count("Permission denied") == 8):  #如果包含8个Permission denied  视为case通过
                        fr.write("##10通过\n")
                    else:
                        fr.write("##10未通过\n")
                        fr.write(i)
                elif i.startswith("#11"):
                    fr.write("##11case还有点问题 待修改\n")    #todo
                    fr.write(i)
                elif i.startswith("#12"):
                    if (i.count("Permission denied") == 2):  #如果包含两个Permission denied  视为case通过
                        fr.write("##12通过\n")
                    else:
                        fr.write("##12未通过\n")
                        fr.write(i)
                elif i.startswith("#13"):
                    if (i.count("Permission denied") == 2):  #如果包含两个Permission denied  视为case通过
                        fr.write("##13通过\n")
                    else:
                        fr.write("##13未通过\n")
                        fr.write(i)
                elif i.startswith("#14"):
                    if (i.count("Permission denied") == 1):  #如果包含两个Permission denied  视为case通过
                        fr.write("##14通过\n")
                    else:
                        fr.write("##14未通过\n")
                        fr.write(i)
                elif i.startswith("#15"):
                    if (i.count("Permission denied") == 2):  #如果包含两个Permission denied  视为case通过
                        fr.write("##15通过\n")
                    else:
                        fr.write("##154未通过\n")
                        fr.write(i)
                elif i.startswith("#16"):
                    if (i.count("Permission denied") == 2):  #如果包含两个Permission denied  视为case通过
                        fr.write("##16通过\n")
                    else:
                        fr.write("##16未通过\n")
                        fr.write(i)
                elif i.startswith("#17"):
                    if (i.count("Permission denied") == 6):  #如果包含5个Permission denied  视为case通过
                        fr.write("##17通过\n")
                    else:
                        fr.write("##17未通过\n")
                        fr.write(i)
                elif i.startswith("#18"):
                    if (i.count("Permission denied") == 6):  #如果包含5个Permission denied  视为case通过
                        fr.write("##18通过\n")
                    else:
                        fr.write("##18未通过\n")
                        fr.write(i)
                elif i.startswith("#19"):
                    if (i.count("Permission denied") == 2):  #如果包含5个Permission denied  视为case通过
                        fr.write("##19通过\n")
                    else:
                        fr.write("##19未通过\n")
                        fr.write(i)
                elif i.startswith("#20"):
                    if (i.count("Permission denied") == 6):  #如果包含5个Permission denied  视为case通过
                        fr.write("##20通过\n")
                    else:
                        fr.write("##20未通过\n")
                        fr.write(i)
                elif i.startswith("#21"):
                    if (i.count("Permission denied") == 16):  #如果包含5个Permission denied  视为case通过
                        fr.write("##21通过\n")
                    else:
                        fr.write("##21未通过\n")
                        fr.write(i)
                elif i.startswith("#22"):
                    if (i.count("pass") == 2):  #如果包含1个pass  视为case通过
                        fr.write("##22通过\n")
                    else:
                        fr.write("##22未通过\n")
                        fr.write(i)


#ftp下载

#def analysis():



if  __name__ == '__main__':
    ip = '192.168.1.127'
    port = 21
    user = 'test'
    passwd = '1'
    fileList = []
    #getfiles(ip,port,user,passwd)
    ftp = ftpconnect(ip,user,passwd)
    ftp.cwd('geyytest/logs')
    fileList = ftp.nlst()
    os.mkdir(r'd:/data/')
    for name in fileList:
        path = 'd:/data/'+ name
        filename = name  #保存FTP文件
        downloadfile(ftp, filename, path)
        readfiles(path)
    ftp.quit()

    # name = "192.168.119.152.log"
    # path = 'd:/data/'+ name
    # readfiles(path)