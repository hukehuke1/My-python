# -*- coding: utf-8 -*-
'''
Created on 2016.4.14

@author: huke
'''
import subprocess
from subprocess import Popen, PIPE
import os
import threading
from time import ctime,sleep

##cmd = "curl http://c57x86.discuz.com/?2100111111111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122266666666662211111222221111122222111112226666666666"
##cmd2 = "curl http://192.168.29.22/bbs/forum.php/?2100111111111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122222111112222211111222221111122266666666662211111222221111122222111112226666666666"
url = "&#x666E;&#x901A;&#x7F51;&#x7AD9;&#x8BBF;&#x5BA2;&#xFF0C;&#x8BF7;&#x8054;&#x7CFB;&#x7F51;&#x7AD9;&#x7BA1;&#x7406;&#x5458;&#xFF1B;"
#url为转码前的“普通网站访客，请联系网站管理员”；


def get_ip(): #解析sitelist   
    r = input("请输入IP，用,隔开（例如http://192.168.29.22/bbs/,http://192.168.19.55/discuz/），使用sitelist.txt的话直接按回车")
    Lsite = []
    Lresult = []
    if r == '':
        f = open("sitelist.txt")
        L = []
        line = f.readline()
        while line:
            if line.startswith((';','::')):#去掉注释
                line = f.readline()
            else:
                line=line.strip('\n')#去掉换行符
                if line != '':
                    L.append(line)
                line = f.readline()
        f.close()
        for x in L:
            Lsite.append(x.split(' ',1)[0])
            Lresult.append(x.split(' ',1)[1].lstrip(' '))
        return(Lsite,Lresult)
    else:#手动输入IP
        Lsite = r.split(',')
        while '' in Lsite:
            Lsite.remove('')#去掉空字符
        for y in r.split(','):
            tmp = y.lstrip('http://').split('/')[0].split(':')[0]
            if tmp != '':
                Lresult.append(tmp)
        return(Lsite,Lresult)
    
def get_case(file):#传入Case文件
    f = open(file)
    L = []
    Lhead = []#Case标题
    Lcase = []#Case内容
    line = f.readline()
    while line:
            if line.startswith((';','::')):#去掉注释
                line = f.readline()
            else:
                line=line.strip('\n')#去掉换行符
                if line != '':
                    if line.startswith('【'):
                        Lhead.append(line)#Case标题
                    elif line.startswith('curl'):
                        Lcase.append(line)#Case内容
                    else:
                        continue
                line = f.readline()
    f.close()
    if len(Lhead) == len(Lcase):

        return(Lhead,Lcase)
    else:
        print("请检查case文件的格式")
        return()



##def get_case2(file):
##    f = open(file)
##    L = []
##    D = {}
##    line = f.readline()
##    while line:
##            if line.startswith((';','::')):#去掉注释
##                line = f.readline()
##            else:
##                line = line.strip('\n')#去掉换行符
##                if line != '':
##                    if line.startswith('【'):
##                        key = line
##                        line = f.readline()
##                        D[key] = line
##                    else:
##                        continue
##                line = f.readline()
##    print(D)#dict无序！暂时放弃这个做法
    
##def testCase(site,result,head,case):
##    resultCount = 0
##    for s in site:
##        caseCount = 0 #第N个测试case
##        maxCase = len(case) #case总数
##        errorCase = 0
##        f = open('%s.txt'%(result[resultCount]),'w')
##        for c in case:
##            c2 = c.replace('%URL%',s)
##            p=subprocess.Popen(c2,stdout=subprocess.PIPE)
##            popResult = p.stdout.read()
##            if url in popResult.decode('utf-8'):
##                print(head[caseCount])
##                print('case通过')
##            else:
##                print(head[caseCount])
##                print('case失败')
##                f.writelines(head[caseCount])
##                f.writelines('没有拦截页面\n')
##                errorCase += 1
##            caseCount += 1
##        f.writelines('有%s个case未通过'%(errorCase))
##        f.close()
##        resultCount += 1
##    #单线程实现



#用线程重写
def threadTestCase(site,result,head,case):
    threads = []
    resultCount = 0
    for s in site:
        if s.endswith('/'):#判断url之后有没有/。
            s2 = s
        else:
            s2 = s + '/'
        t = threading.Thread(target=teadCase,args=(s,result[resultCount],head,case))
        threads.append(t)
        resultCount += 1
    for t in threads:
        t.setDaemon(True)
        t.start()            
    t.join()
    
def teadCase(s,resultCount,head,case):#s是网站URL，resultCount是测试结果文件名
    caseCount = 0 #第N个测试case
    maxCase = len(case) #case总数
    errorCase = 0
    f = open('%s.html'%(resultCount),'w')
    for c in case:
        c2 = c.replace('%URL%',s)
        p=subprocess.Popen(c2,stdout=subprocess.PIPE)
        popResult = p.stdout.read()
        if url in popResult.decode('utf-8','replace'):#decode的时候忽略错误
            print(head[caseCount])
            print('case通过')
        else:
            print(head[caseCount])
            print('case失败')
            f.writelines(head[caseCount])
            gbkTypeStr = popResult.decode('utf-8','ignore').encode("GBK", 'ignore')
            f.writelines(popResult.decode('GBK','ignore'))
            errorCase += 1
        caseCount += 1
    if len(case) == errorCase:
        f.writelines('%s一个Case都没通过，防护不生效'%(resultCount))
    else:
        f.writelines('%s一共%s个case,有%s个case未通过'%(resultCount,len(case),errorCase))
    f.close()

        
if __name__ == '__main__':
    try:
        Lsite , Lresult = get_ip()#sitelist.txt和测试case文件可用;或者::作为注释
        Lhead , Lcase = get_case("pima.txt") #如果想要更改测试case，修改这个文件名
        threadTestCase(Lsite , Lresult , Lhead , Lcase)
        print('脚本执行完毕')
        input()
    except Exception as e:
        print(e)