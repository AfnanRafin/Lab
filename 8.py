from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By

v = Options()
v.add_experimental_option("detach", True)

driver = webdriver.Chrome(options=v)
driver.get('https://www.facebook.com/')

# TAG & ID
driver.find_element(By.CSS_SELECTOR, 'input#email').send_keys('abc')

# TAG & CLASS
driver.find_element(By.CSS_SELECTOR, 'input.inputtext').send_keys('abc')

# TAG & ATTRIBUTE
driver.find_element(By.CSS_SELECTOR, 'input[data-testid="royal_email"]').send_keys('abcdef')

# TAG, CLASS & ATTRIBUTE
driver.find_element(By.CSS_SELECTOR, 'input.inputtext[name=email]').send_keys('xyz')
driver.find_element(By.CSS_SELECTOR, 'input.inputtext[name=pass]').send_keys('123')
