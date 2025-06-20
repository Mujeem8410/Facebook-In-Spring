package com.eschool.services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendLoginEmail(String toEmail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("My Facebook Login Notification");
        message.setText("Dear " + toEmail
				+ ",\n\nYou have successfully logged into your facebook account.\n\nBest regards,\nSaif Tech App Team");

        mailSender.send(message);
    }
}
