# -*- coding:utf-8 -*-
'''
Created on 2016年3月24日

@author: huke
'''
def countScore():
    try:
        a = int(input('请输入之前的成绩'))
        b = int(input('请输入之后的成绩'))
        s = b - a
        if ((a in range(0,101)) and (b in range(0,101))):#判断范围
            if s > 0 :
                s1 = (s/a)*100
                print('恭喜你，你的成绩提高了%.1f%%'%s1)
            elif s == 0:
                print('成绩不变，请继续努力')
            elif s < 0:
                s2 = (-s/a)*100
                print('你的成绩下降了%.1f%%'%s2)
        else:
            print('输入的成绩有误，请输入正确的成绩')
    except Exception as e:#python3.0新变化，"as"
        print(str(e))
if __name__ == '__main__':
    countScore()
    
