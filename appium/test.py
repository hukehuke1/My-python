# -*- coding: utf-8 -*-
'''
Created on 2017.7.12

@author: huke
'''
import time
import os
import unittest
from appium import webdriver

# Returns abs path relative to this file and not cwd
PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)
class ContactsAndroidTests(unittest.TestCase):
    def setUp(self):
        desired_caps = {}
        desired_caps['platformName'] = 'Android'
        desired_caps['platformVersion'] = '4.2'
        desired_caps['deviceName'] = 'Android Emulator'
        desired_caps['app'] = PATH(
            'cloudlock-android-v3.apk'
        )
        desired_caps['noReset'] = 'true'   #禁止重复安装
        desired_caps['appPackage'] = 'com.jowto.yunsuo'
        desired_caps['appActivity'] = '.activity.LoginActivity'
        self.driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
    def tearDown(self):
        self.driver.quit()
    def test_add_contacts(self):
        textfields = self.driver.find_elements_by_class_name("android.widget.EditText")
        textfields[0].send_keys("huke@jowto.com")
##        textfields[0].send_keys("huke@jowto.com")
##        textfields[1].send_keys("jowto1234")
##        self.assertEqual('Appium User', textfields[0].text)
##        self.assertEqual('someone@appium.io', textfields[1].text)
        textfields[1].send_keys("jowto1234")
        button = self.driver.find_elements_by_class_name("android.widget.Button")
        button[0].click()#这个button是个list，所以还得用button[0]来触发
        self.driver.implicitly_wait(5)#按了按钮之后wait
        a = self.driver.find_elements_by_class_name("android.widget.TextView")[0]
        print(a)
##        self.assertEqual('云锁',self.driver.find_elements_by_class_name("android.widget.EditText").text)#判断是否登录成功


    
L = {}
Lpasswd = []
Lusername = []
def get_info():
    fname = open('username.txt')
    Ltemp = fname.readlines()
    for x in Ltemp:
        x=x.rstrip()#去掉换行符
        Lusername.append(x)
    fname.close()

    fwd = open('passwd.txt')
    Ltemp = ()
    Ltemp = fwd.readlines()
    for y in Ltemp:
        y = y.rstrip()#去掉换行符
        Lpasswd.append(y)
    fwd.close()
    if (len(Lusername)==len(Lpasswd)):
        L = dict(zip(Lusername,Lpasswd))
        print(L)
    else:
        print('用户名与密码数量不匹配')
    return(L)


if __name__ == '__main__':
##    L = get_info()
    suite = unittest.TestLoader().loadTestsFromTestCase(ContactsAndroidTests)
    unittest.TextTestRunner(verbosity=2).run(suite)
