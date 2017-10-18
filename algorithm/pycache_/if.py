# -*- coding:utf-8 -*-
from decimal import Decimal

def countBMI(weight,height):#计算BMI
    try:
        w=float(weight)
        h=float(height)
        B=round(Decimal(w/(h*h)),2)
        print('BMI是%.2f'%(B))
        return(B)
    except Exception as e:
        print(e)

def analysisBMI(bmi):#根据BMI分析
    try:
        if bmi<=0:
            print('请输入正确的身高体重')
        elif bmi <=18.5:
            print('过轻')
        elif bmi <=25:
            print('正常')
        elif bmi <=28:
            print('过重')
        elif bmi <=32:
            print('肥胖')
        elif bmi >32:
            print('严重肥胖')
        else:
            print('请输入正确的身高体重')
    except Exception as e:
        print(e)
    
if __name__ == "__main__":
    weight=input('请输入体重(单位kg)')
    height=input('请输入身高(单位m)')
    bmi=countBMI(weight,height)
    analysisBMI(bmi)
    input()
    
