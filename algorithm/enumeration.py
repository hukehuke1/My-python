# -*- coding:utf-8 -*-
'''
Created on 2016.6.13

@author: huke
'''
def enum():
    for x1 in range(1,10):
        for x2 in range(10):
            for x3 in range(10):
                for x4 in range(10):
                    for x5 in range(1,10):
                        mul = x1*10000 + x2*1000 + x3*100 + x4*10 + x5
                        result = x5*100000 + x5*10000 + x5*1000 + x5*100 + x5*10 +x5
                        if mul*x1 == result:
                            print(x1,x2,x3,x4,x5)
if __name__ == '__main__':
    enum()