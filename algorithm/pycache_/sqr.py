# -*- coding: utf-8 -*-
'''
Created on 2016年3月24日

@author: huke
'''
import math
def quadratic(a,b,c):
    try:
        x1=(-b+math.sqrt(b*b-4*a*c))/(2*a)
        x2=(-b-math.sqrt(b*b-4*a*c))/(2*a)
        return x1,x2
    except Exception as e:
        print(e)
if __name__ == '__main__':
    try:
        print(quadratic(2, -3, 1))  
        print(quadratic(1, 3, -4))
##        a=input('a')
##        b=input('b')
##        c=input('c')
##        print(quadratic(int(a),int(b),int(c)))
    except Exception as e:
        print(e)
    
