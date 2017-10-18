# -*- coding:utf-8 -*-
'''
Created on 2016.6.21

@author: huke
'''
import random.randint


if __name__ == '__main__':
    a = random.randint(0,99)
    count = 0
    b = int(input('请输入猜测数字'))
    while a != b :
        if a > b:
            print('猜的数小了，再猜~')
            b = int(input('请输入猜测数字'))
            count += 1 
        elif a < b:
            print('猜的数大了，再猜~')
            b = int(input('请输入猜测数字'))
            count += 1 
    print('恭喜你猜中啦,一共用了%s次'%(count))