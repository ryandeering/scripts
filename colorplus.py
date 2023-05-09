import requests
from bs4 import BeautifulSoup
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

sender_email = "cdrgamescdr@gmail.com"
receiver_email = "ryandeering1@gmail.com"
password = ""

url = "https://www.thebiggerpicture.ie/product-page/kodak-color-plus-200"

def check_availability():
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    return "Out of Stock" not in soup.get_text()

def send_email():
    message = MIMEMultipart()
    message['From'] = sender_email
    message['To'] = receiver_email
    message['Subject'] = "Colorplus in stock!"
    body = f"The item at {url} is now in stock."
    message.attach(MIMEText(body, 'plain'))

    try:
        with smtplib.SMTP_SSL('smtp.gmail.com', 465) as server:
            server.login(sender_email, password)
            server.sendmail(sender_email, receiver_email, message.as_string())
        print("Email sent successfully.")
    except Exception as e:
        print(f"Error sending email: {e}")

if check_availability():
    send_email()