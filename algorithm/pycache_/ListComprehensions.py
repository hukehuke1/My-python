# -*- coding:utf-8 -*-
'''
Created on 2016骞�4鏈�1鏃�

@author: huke
'''

def listComprehensions(L=[]):
    print(L)
    print([s.lower() for s in L if isinstance(s,str)])
    
    
if __name__ == '__main__':
    L1 = ['Hello', 'World', 18, 'Apple', None]
    listComprehensions(L1)
