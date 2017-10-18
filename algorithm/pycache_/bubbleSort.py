# -*- coding:utf-8 -*-
'''
Created on 2016��3��17��

@author: huke
'''

def bubbleSort(array):
    for i in range(len(array)-1,0,-1):
        for j in range(0,i):
            if array[j]>array[j+1]:
                array[j],array[j+1] = array[j+1],array[j]
    print(array)
    
    
    
if __name__ == '__main__':
    try:
        array = [22, 1, 5, 3, 6, 8, 4,12]
        bubbleSort(array)
    except Exception as e: 
        print(e)