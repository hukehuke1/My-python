# -*- coding: utf-8 -*-
'''
Created on 2016.6.14

@author: huke
'''

def mul(n):
    if n <= 1:
        return 1
    else:
        return n*mul(n-1)

if __name__ == '__main__':
    n = input('请输入阶乘的次数')
    print(mul(int(n)))