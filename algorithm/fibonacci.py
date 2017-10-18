# -*- coding:utf-8 -*-
'''
Created on 2016.6.12

@author: huke
'''

def fib(n):
    if n == 1 :
        return 1
    elif n == 2:
        return 1
    else:
        return fib(n-1) + fib(n-2)

if __name__ == '__main__':
    i = int(input("请输入月份"))
    print("%d月的兔子是%d"%(i,fib(i)))
    for m in range(1,i):
        print("%d月的兔子是%d"%(m,fib(m)))