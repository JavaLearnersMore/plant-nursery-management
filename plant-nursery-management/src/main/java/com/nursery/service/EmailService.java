package com.nursery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendOtp(String toEmail, String otp) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Plant Nursery Management Login OTP");
        // ✅ USE HERE 👇
//        message.setText(
//            "Dear User,\n\n" +
//            "Your OTP for HostelMS login is: " + otp + "\n\n" +
//            "This OTP is valid for 5 minutes.\n\n" +
//            "Regards,\nHostelMS"
//        );
        
        message.setText("Your OTP is: " + otp + "\nValid for 5 minutes.");

        mailSender.send(message);
    }
}
