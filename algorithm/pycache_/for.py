# -*- coding:utf-8 -*-
'''
Created on 2017.3.29

@author: huke
'''

# def fib(n):
#     if n == 1:
#         return 1;
#     elif n == 2:
#         return 1;
#     else:
#         return fib(n-1)+fib(n-2)
# 
# if __name__ == '__main__':
#     count = 0
#     x = int(input('请输入数字'))
#     while count <=10:
#         print(pow(int(x),int(count)))
#         count +=1
#     
#     for y in range(1,x):
#         print(fib(y))

#99乘法表
# if __name__ == '__main__':
#     for x in range(1,10):
#         for y in range(1,x+1):
#             print('%s*%s=%s'%(x,y,x*y))
#     pass

#余数
# if __name__ == '__main__':
#     for i in range(1,1001):
#         if (i % 3 == 2) & (i % 5 == 2) & (i % 7 == 2):
#             print(i)

#回文
# if __name__ == '__main__':
#     for i in range(1,1001):
#         s = str(i)
#         if s == s[::-1]:
#             print(s)


import re
with open("from.txt") as f:
    data = f.read()
    print(data)
# f1 = open('from.txt')
# data = f1.read()
# print(data)
# f1.close()