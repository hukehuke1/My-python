# -*- coding:utf-8 -*-
'''
Created on 2016年3月24日

@author: huke
'''
def Cycle():
    L = ['Bart', 'Lisa', 'Adam']
    for x in L:
        print(x)
def Cycle2():
    s = 0
    for x in range(101):
        s += x
    print(s)
if __name__ == '__main__':
    Cycle()
    Cycle2()
    input()
