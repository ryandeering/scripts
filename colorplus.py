import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import requests
from bs4 import BeautifulSoup

SENDER_EMAIL = ""
RECEIVER_EMAIL = ""
PASSWORD = ""

URL = ""

def check_availability():
    response = requests.get(URL, timeout=10)
    soup = BeautifulSoup(response.text, 'html.parser')
    return "Out of Stock" not in soup.get_text()

def send_email():
    message = MIMEMultipart()
    message['From'] = SENDER_EMAIL
    message['To'] = RECEIVER_EMAIL
    message['Subject'] = "Colorplus 200 in stock!"
    body = f"Colorplus 200 {URL} is now in stock."
    message.attach(MIMEText(body, 'plain'))

    try:
        with smtplib.SMTP_SSL('smtp.gmail.com', 465) as server:
            server.login(SENDER_EMAIL, PASSWORD)
            server.sendmail(SENDER_EMAIL, RECEIVER_EMAIL, message.as_string())
        print("Email sent successfully.")
    except smtplib.SMTPException as error:
        print(f"Error sending email: {error}")

if check_availability():
    send_email()
