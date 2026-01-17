from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
v = Options()
v.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=v)
driver.get('https://www.grameenphone.com/')
driver.maximize_window()
driver.close()