# -*- coding:utf-8 -*-
'''
Created on 2016.4.13 

@author: huke
'''

L = [('Bob', 75), ('Adam', 92), ('Bart', 66), ('Lisa', 88)]
def by_name(t):
    return t[0].capitalize()
def by_score(t):
    return t[1]

if __name__ == '__main__':
    try:
##        L2 = sorted(L , key = by_name) #按照名字排序
##        print(L2)
        L3 = sorted(L , key = by_score, reverse=True)#按照分数排序
        print(L3)
    except Exception as e:
        print(e)
    input()
