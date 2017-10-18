# -*- coding: utf-8 -*-
'''
Created on 2016.6.7

@author: huke
'''


def price():
    oldprice = input('请输入商品的真实价格')
    price = input('请输入试猜的价格')
    i=1
    while price != oldprice: 
        if int(price) > int(oldprice):#注意，比大小的时候务必记着转换成int
            i += 1
            print('价格高了')
            price = input('请输入试猜的价格')
        elif int(price) < int(oldprice):
            i += 1
            print('价格低了')
            price = input('请输入试猜的价格')
    print('猜中了，一共猜了%s次'%(i))

if __name__ == '__main__':
    price()
