package com.bridgelabz.spring.utility;


import java.util.Date;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EmailUtility
{
	@Autowired
	private Session session;
	
	
    public EmailUtility(Session session) {
		this.session = session;
	}



	public  void sendEmail(String toAddress,String subject, String msg) throws AddressException,MessagingException 
    {

    	System.out.println("Session : "+session);
    	
        // creates a new e-mail message
        Message message = new MimeMessage(session);
 
            
        message.setFrom(new InternetAddress("bankofjodhana@gmail.com"));
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        message.setRecipients(Message.RecipientType.TO, toAddresses);
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setText(msg);
 
        // sends the e-mail
        Transport.send(message);
    }
}