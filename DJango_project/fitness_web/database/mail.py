import email.message
import email, smtplib, ssl

from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# sender = 'python.vmm@gmail.com'
# password = 'vmmpython'

sender = 'tania.vmmteachers23@gmail.com'
password = 'Teachers@123'


# receiver = 'rahul@vmmeducation.com'
def send_Mail(receiver):
    try:
        smtpserver = smtplib.SMTP("smtp.gmail.com", 587)
        smtpserver.ehlo()
        smtpserver.starttls()
        # smtpserver.ehlo
        smtpserver.login(sender, password)
        body = "your password is  change after login"
        subject = "Subject:teacher password \n\n "
        msg = subject + body
        smtpserver.sendmail(sender, receiver, msg)
        print('Sent')
        smtpserver.close()
    except smtplib.SMTPException:
        print("Not Sent")


def checkthis():
    receiver = 'rkb9874@gmail.com'
    username = 'Rahul'
    mobile = '6280995201'
    print(mobile)
    sender = 'tania.vmmteachers23@gmail.com'
    password = 'Teachers@123'

    smtpserver = smtplib.SMTP("smtp.gmail.com", 587)
    smtpserver.ehlo()
    smtpserver.starttls()
    smtpserver.login(sender, password)
    body = f"""
                <html>
                <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                </head>
                <body>
                    
                </table>
            </body>
                """
    msg = email.message.Message()
    msg['Subject'] = 'Signup in Zomato'

    msg['From'] = sender
    msg['To'] = receiver
    password = password
    msg.add_header('Content-Type', 'text/html')
    msg.set_payload(body)
    smtpserver.sendmail(sender, receiver, msg.as_string())
    print('Sent')
    smtpserver.close()


def mailwithAttachemnt(reciver,id,filelocation):

    subject = "QR Code"
    # body = "This is an email with attachment sent from Python"

    body = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <p>dear member,<br>
        your id number is {}. download this file</p>
    </body>
    </html>
    """.format(id)

    sender_email = "tania.vmmteachers23@gmail.com"
    receiver_email = reciver
    password = "Teachers@123"

    # Create a multipart message and set headers
    message = MIMEMultipart()
    message["From"] = sender_email
    message["To"] = receiver_email
    message["Subject"] = subject
    message["Bcc"] = receiver_email  # Recommended for mass emails

    # Add body to email
    # message.attach(MIMEText(body, "plain"))
    message.attach(MIMEText(body, "html"))

    # filename = "../static/pdf/8SigneRichardson.pdf"  # In same directory as script
    filename = filelocation  # In same directory as script

    # Open PDF file in binary mode
    with open(filename, "rb") as attachment:
        # Add file as application/octet-stream
        # Email client can usually download this automatically as attachment
        part = MIMEBase("application", "octet-stream")
        part.set_payload(attachment.read())

    # Encode file in ASCII characters to send by email
    encoders.encode_base64(part)

    # Add header as key/value pair to attachment part
    part.add_header(
        "Content-Disposition",
        f"attachment; filename= {filename}",
    )

    # Add attachment to message and convert message to string
    message.attach(part)
    text = message.as_string()

    # Log in to server using secure context and send email
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, text)


if __name__ == '__main__':
    mailwithAttachemnt('rkb9874@gmail.com',2,"../static/pdf/9RanaMccormick.pdf")
