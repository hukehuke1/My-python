#-*- conding:utf-8 -*-
'''
Created on 2016.4.7
map&reduce:
http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014317852443934a86aa5bb5ea47fbbd5f35282b331335000
@author:huke
'''
from functools import reduce

def starint(s):#把字符串转化为INT
    def fn(x,y):
        return x * 10 + y
    def char2num(s):
        return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]
    return reduce(fn,map(char2num,s))#reduce和map的方法
def normalize(s):#接受数组
    for i in range(len(s)):
        s2=[]
        s2.insert(i, s[i][:1].upper() + s[i][1:].lower())
        return s2
def normalize2(s):#接受字符串  其实用capitalize()能直接解决问题。。。
    return s[:1].upper() + s[1:].lower()

def prod(L):
    def multiply(x,y):
        return x * y
    return reduce (multiply,L)
def str2float(str):
    def fn(x,y):
        return x * 10 + y
    n = str.index('.')
    s1 = list(map(int,[x for x in str[:n]]))
    s2 = list(map(int,[x for x in str[(n+1):]]))
    return reduce(fn,s1)+reduce(fn, s2)*0.1**len(s2)
if __name__ == '__main__':
    try:
        print('str2float(\'123.456\') =', str2float('123.456'))
        print('是否是float：%s'%isinstance(str2float('123.456'), float))
    except Exception as e:
        print(e)
'''
    try:
        print('3 * 5 * 7 * 9 =', prod([3, 5, 7, 9]))
    except Exception as e:
        print(e)
'''
'''
    try:
        L1 = ['adam', 'LISA', 'barT']
        L2 = list(map(normalize2, L1))
        print(L2)
    except Exception as e:
        print(e)
'''
'''
    try:
        s=input('请输入数字')
        print(starint(s))
        print('是否转化为了int:%s'%isinstance(starint(s),int))
    except Exception as e:
        print(e)
'''
