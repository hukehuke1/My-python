# -*- coding:utf-8 -*-
'''
Created on 2016.4.13 

@author: huke
'''
def is_palindrome(n):
    s = str(n)
    return s == s[::-1]


if __name__ == '__main__':
    try:
        output = filter(is_palindrome, range(1, 1000))
    except Exception as e:
        print(e)
    print(list(output))
    input()
