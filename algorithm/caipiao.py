'''
Created on 2016.6.14

@author: huke
'''

def combine(num2,max2,max):
    i = num2
    j = max-1
    for x in range(max2,i):
        if max2 >1:
            combine(i-1,max2-1,max);
        else:
            for y in range(0,max-1):
                print(max)
                print('\n')
if __name__ == '__main__':
    Max_ = 4
    Num = 29
    num = []
    lottey = []
    for x in range(0,Num):
        num.append(x+1)
    for y in range(0,Num):
        lottey.append(0)
    combine(Num, Max_, Max_);
        