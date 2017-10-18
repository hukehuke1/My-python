# -*- coding:utf-8 -*-
'''
Created on 2016

@author: huke
'''

STEP=0#定义全局变量

def move(n,a,b,c):
    try:
        global STEP#声明全局变量
        if n == 0:
            return 0
        else:
            move(n-1, a, c , b)#将n-1个盘挪到b上
            STEP= STEP+1
            print('%s --> %s'% (a, c),'step=%s'%(STEP))#将最底下的盘挪到C
            move(n-1, b, a, c)#将n-1个盘挪到c上
            return
    except Exception as e:
        print(e)
if __name__ == '__main__':
    n=int(input('汉诺塔上盘的个数'))
    move(n, 'a', 'b', 'c')
