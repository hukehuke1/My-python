# -*- coding:utf-8 -*-
'''
Created on 2016��4��1��

@author: huke
'''
def fib(max):
    n,a,b = 0 ,0 ,1
    while n < max:
        print(b)
        a , b = b , a+b
        n += 1
        return "done"

if __name__ == '__main__':
    fib(8)