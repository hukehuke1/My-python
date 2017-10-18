#coding:utf-8
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
# browser = webdriver.Firefox()
# browser.get('http://www.baidu.com/')
# 
# browser.find_element_by_id("kw").send_keys("selenium")
# browser.find_element_by_id("su").click()
# print("浏览器最大化")
# browser.maximize_window()


# driver = webdriver.Firefox()
# driver.get("http://m.mail.10086.cn")
# ��������Ϊ���ص�
# print("设置分辨率480*800")
# driver.set_window_size(480, 800)


import time

driver = webdriver.Firefox()

#访问百度首页
first_url = 'http://www.baidu.com/'
driver.get(first_url)
driver.find_element_by_id("kw").send_keys("selenium")
driver.find_element_by_id("kw").send_keys(Keys.BACK_SPACE)
time.sleep(2)
driver.find_element_by_id("kw").send_keys(Keys.SPACE)
driver.find_element_by_id("kw").send_keys(u"教程")
time.sleep(2)
driver.find_element_by_id("kw").send_keys(Keys.CONTROL,'a')
time.sleep(2)
driver.find_element_by_id("kw").send_keys(Keys.CONTROL,'x')
time.sleep(2)
element = WebDriverWait(driver,10).until(lambda driver:driver.find_element_by_id("kw"))
element.send_keys(Keys.CONTROL,'v')
# driver.find_element_by_id("kw").send_keys(Keys.CONTROL,'v')


driver.implicitly_wait(30)
driver.find_element_by_id("su").send_keys(Keys.ENTER)

title = driver.title
print("title=%s"%(title))

now_url =driver.current_url
print("now_url=%s"%(now_url))
# driver.find_element_by_id("kw").send_keys("selenium")

# print("now access %s"%(first_url))
# driver.get(first_url)
# 
# #访问新闻页面
# second_url='http://news.baidu.com'
# print("now access %s"%(second_url))
# driver.get(second_url)
# 
# #后退到首页
# print("back to %s"%(first_url))
# driver.back()
# 
# #前进到新闻页面
# print("forward to %s"%(second_url))
# driver.forward()




#driver.quit()