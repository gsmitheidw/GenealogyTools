import re
import sys
import time
import configparser
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.firefox.options import Options
from webdriver_manager.firefox import GeckoDriverManager

print("Working....")

# Read configuration from config.ini
config = configparser.ConfigParser()
config.read('Test-MatchGedmatch.ini')

# Get credentials from config.ini
username = config.get('credentials', 'username')
password = config.get('credentials', 'password')
kit1_value = config.get('credentials', 'kit1')

options = Options()
options.headless = True
options = webdriver.FirefoxOptions()
options.add_argument("--headless")

# Initialize Firefox WebDriver
driver = webdriver.Firefox(options=options)

# URL of the login page
login_url = 'https://app.gedmatch.com/login1.php'

# Navigate to the login page
driver.get(login_url)

# Find and fill in the email field
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, 'email')))
email_field = driver.find_element(By.ID, 'email')
email_field.send_keys(username)  # Update with your email

# Find and fill in the password field
password_field = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, 'password')))
password_field.send_keys(password)  # Update with your password

# Find and click the login button
login_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, '.btn--register')))
login_button.click()

# Wait for the login process to complete and page to load
time.sleep(3)  # Adjust wait time as needed

# URL of the web form
url = 'https://app.gedmatch.com/v_compare1.php'

# Navigate to the web form
driver.get(url)


# Ask user for input for kit2
#kit2_value = input("Enter the value for kit2: ")

# Get kit2 value from command-line arguments
if len(sys.argv) > 1:
    kit2_value = sys.argv[1]
else:
    print("Please provide the value for kit2 as a command-line argument!")
    sys.exit(1)

# Find and fill in kit1 field
kit1_input = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, 'kit1')))
kit1_input.clear()
kit1_input.send_keys(kit1_value)

# Find and fill in kit2 field
kit2_input = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, 'kit2')))
kit2_input.clear()
kit2_input.send_keys(kit2_value)

# Submit the form
kit2_input.submit()

# Wait for the page to load
time.sleep(3)  # Adjust the wait time as needed

page_source = driver.page_source

# Define a regular expression pattern to match the desired text
pattern = r'<br>(\d+) shared segments found for this comparison\.<br>'

# Search for the pattern in the page source
match = re.search(pattern, page_source)

# Check if the pattern is found
if match:
    print("Match found")
else:
    print("No match")

# Close the WebDriver session
driver.quit()
