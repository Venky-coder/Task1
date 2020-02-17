

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtils {
	public int sendMail(String recepient,String name,int otp) throws Exception {
		System.out.println("Preparing to send email");
		Properties properties= new Properties();
		
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");

		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		String myAccountEmail="kapsepooja7@gmail.com";
		String password="Pooja@0711";
		
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myAccountEmail, password);
			}
		});
		
		Message message= prepareMessage(session,myAccountEmail,recepient,name,otp);
		Transport.send(message);
		System.out.println("message sent successfully");
		System.out.println("otp is :"+ otp);
		System.out.println("name is :"+ name);
		return 1;
	}	
	
	private static Message prepareMessage(Session session,String myAccountEmail,String recepient,String name,int otp){
		try {
		Message message=new MimeMessage(session);
		message.setFrom(new InternetAddress(myAccountEmail));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient) );
		message.setSubject("Email OTP (One Time Password) for reset password");
		message.setText("Dear " + name+" ,\r\n" + " Your email one time password(OTP) for reset password is: "+otp);
		return message;
			
		}catch(Exception ex) {
			Logger.getLogger(JavaMailUtils.class.getName()).log(Level.SEVERE,null,ex);
		}
		return null;

	}
	

}
