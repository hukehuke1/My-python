from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.keys import Keys
import time

browser = webdriver.Firefox() # Get local session of firefox
browser.get("http://www.baidu.com")
assert "360搜索".decode('utf-8') in driver.title
print(browser.title)
browser.close()
