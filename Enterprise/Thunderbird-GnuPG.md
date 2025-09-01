
# The HCA help desk or Email department will likely know all the answers. Hopefully that will be quick and easy.

If you want to try and discover them yourself, here are some notes. I’ve added additional comments in green.

The Thunderbird needs to know the mail server(s) to receive and send messages through. The Thunderbird program is only needed when opening or sending a PGP encrypted message. (Outlook can do it, but the add-ons cost money)

I recommend changing the name of the Thunderbird icon on the desktop to “Secure Email” to remind the user of what it is for, and say that they should use Outlook for everything else.

I found some instructions specific to helping Thunderbird connect to Exchange:

http://oregonstate.edu/helpdocs/node/548

I’ll copy and paste below, edited for what I know or guess of your network names.

Follow the instructions below to set up Thunderbird to receive your exchange? email.

1. Open Thunderbird

o Note: If this is the first time opening Thunderbird, it will automatically ask you to add a new account. If this is the case, you can skip to step D

2. Go to Tools and click on account settings

3. Under Account Actions in the bottom left, select 'Add Mail Account'

4. Fill in the Name field (This part is just a matter of personal preference)

5. Enter in your first.last@HCAhealthcare.com into the Email field and type in your password below.

6. Click on the 'Continue' Button in the bottom right, then when it appears click on the 'Manual Config' Button in the bottom left. The window will expand and create more options you can fill in

7. On the Incoming row:

o Select IMAP from the dropdown menu

o Type gw.nas.medcity.net in the server hostname box (MM - This setting can be tested, see notes are below)

o Select 993 from the Port dropdown menu

o Select SSL/TLS from the SSL dropdown menu

o Select Normal Password from the Authentication dropdown menu

8. On the Outgoing row:

o Type smtp-gw.nas.medcity.net in the server hostname box

o Select 587 from the Port dropdown menu (MM - This setting can be tested, see notes below)

o Select STARTTLS from the SSL dropdown menu

o Select Normal Password from the Authentication dropdown menu

9. Enter your domain (either MedCity.net or MEDCITY), followed by a backslash ("\"), followed by your username (blv6864) in the Username box

o Note: If you don't know your domain, username, or password, you can contact your Department Computer Administrator for help.

10. Once finished, all the settings should look like this (click on image for larger version):

Description: Thunderbird Exchange

11. Click the Advanced Config Button. This will open up the Thunderbird settings window shown below.

12. Once open, click on the Outgoing Server option in the left-hand menu

13. Make sure the outgoing server you just created (will be called mail.oregonstate.edu) is set to default and selected

14. Click the Edit button (you can click on the image below for a larger version)Description: Thunderbird Main Settings

15. Remove the domain and backslash from the username box (either MEDCITY\, or MedCity.net\)Description: Domain Removal

16. Click OK when you are finished, then OK again to close the main settings window

o Note: This may seem counter-intuitive, adding the domain, then removing it again. For some reason, Thunderbird will not send mail without removing the domain, but if the domain is not present at the beginning, Thunderbird will not retrieve mail. It should be able to receive and send mail just fine if you follow the above instructions exactly.

Thunderbird should then begin downloading your mail!

It may take a while to download all your mail if you have a large mailbox, or a slower network connection. If your mail doesn't appear at first, give it time to catch up. After a few minutes your mailbox should load.

To test the server names,

Method 1)

Start, Programs, Accessories, Command Prompt

In the black rectangular box that opens, type:

NSLOOKUP

At the > prompt, type:

gw.nas.medcity.net

smtp-gw.nas.medcity.net

imap-gw.nas.medcity.net

exchange.medcity.net

If the name entered is a real server name, you will see the name followed by its IP address. If the name isn’t a valid server, you will see “can't find gw.nas.medcity.net: Non-existent domain”

To find the name of your exchange server, type these commands in the Command Prompt – nslookup:

set type=all

_autodiscover._tcp.hcahealthcare.com

_autodiscover._tcp.medcity.net

Type:

exit

to exit nslookup

Method 2)

If you have Windows XP, this is easy, (if you have Windows 7, you would probably have to first go to Control Panel, Programs and Features, Turn Windows features on or off, check the box beside Telnet Client, click OK)

In the Command prompt, type:

telnet

At the > prompt, type:

open smtp-gw.nas.medcity.net 25

If it is not the correct server name and port number, you will see “Could not open connection to the host, on port 25:”

If it is correct, you will see “220 smtp-gw.nas.medcity.net Microsoft ESMTP MAIL Service,”

If you connect successfully, type the following to exit:

quit

If you don’t connect, try another combination:

open gw-nas.medcity.net 25

try various names. After identifying the SMTP server, you can test for the IMAP by changing the 25 to the number 143

open imap-gw.nas.medcity 143

open exchange.medcity.net 143

If it is correct, you will see “+OK Microsoft Exchange IMAP4rev1 server”

If you connect successfully, press the following two keys to exit:

Ctrl+[

Type:

quit

To exit telnet

Type:

exit

To exit Command Prompt

Sources for these techniques:

How to verify that SRV DNS records have been created for a domain controller

http://support.microsoft.com/kb/816587

A new feature is available that enables Outlook 2007 to use DNS Service Location (SRV) records to locate the Exchange Autodiscover service

http://support.microsoft.com/kb/940881

XFOR: Telnet to Port 25 to Test SMTP Communication

http://support.microsoft.com/kb/153119

How to verify basic IMAP connectivity by using Telnet

http://support.microsoft.com/kb/189326
