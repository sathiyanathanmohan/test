package com.ennvee.ProjectManagement.dao;
import java.util.Properties; 

import javax.mail.*; 
import javax.mail.internet.*; 

public class dipanshu{ 
public static void main(String[] args) { 

String to="e.thirumalaikumari@ennvee.net";//change accordingly 
final String from="sathiyanathan.m@ennvee.net";//change accordingly 
final String password="Sathiya@1994";//change accordingly 

//Get the session object 
Properties props = new Properties(); 
props = new Properties();
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.port", "587");
props.put("mail.smtp.host", "m.outlook.com");
props.put("mail.smtp.auth", "true");
Session session = Session.getInstance(props, new Authenticator() {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("sathiyanathan.m@ennvee.net","Sathiya@1994");
    }
});


//compose message 
try { 
MimeMessage message = new MimeMessage(session); 
message.setFrom(new InternetAddress(from)); 
message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
message.setSubject("Nothing Special.."); 
message.setText("Send Mail By Java Programmm...."); 

//send message 
Transport.send(message); 

System.out.println("message sent successfully"); 

} catch (MessagingException e) {throw new RuntimeException(e);} 

} 
}