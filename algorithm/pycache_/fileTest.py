# -*- coding: utf-8 -*-
'''
Created on 2016��3��18��

@author: huke
'''
import os

class FileTest(object):
    '''
    classdocs
    '''


    def __init__(self):
        '''
        Constructor
        '''
        self.testdir = 'C:\\Python33\\test'


    def test1(self):
        print('splitdrive()')
        if os.path.exists(self.testdir):
            os.chdir(self.testdir)
            a,b = os.path.splitdrive(self.testdir)#分割盘符
            print('盘符是%s \n路径是%s' %(a,b))
            t = os.getcwd()#取得当前目录
            print(t)
        print('splitext()')
        if os.path.exists(self.testdir + '\\mydata.txt'):
            c,d = os.path.splitext(self.testdir + '\\mydata.txt')
            print('路径是%s \n后缀是%s' %(c,d))
            
    def getDirList(self,p):
        p = str(p)
        if p =='':
            return []
        p.replace('/','\\' )
        if p[-1] != '\\':
            p = p+'\\'
        e = os.listdir(path=p)
        f = [x for x in e if os.path.isdir(p+x)]
        return f
if __name__ == '__main__':
    f = FileTest()#类实例化
    f.test1()
    print(f.getDirList('C:\\'))
    
