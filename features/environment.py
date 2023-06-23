
from selenium import webdriver

# before all
def before_all(context):
    chrome_options = webdriver.chrome.options.Options()
    chrome_options.add_argument('--headless')
    context.browser = webdriver.Chrome(executable_path=r"/snap/bin/chromium.chromedriver", options=chrome_options)

def after_all(context):
    context.browser.quit()
