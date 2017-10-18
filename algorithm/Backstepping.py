# -*- coding:utf-8 -*-
'''
Created on 2016.6.12

@author: huke
'''
def backStepping(n):
    Fetch = 1000
    Rate = 0.017
    if n == 48:
        return 0;#递归 要有终止条件
    else:
        return (backStepping(n+1)+ Fetch)/( 1+ Rate/12) 
    
    

if __name__ == '__main__':
    print(backStepping(0))
    