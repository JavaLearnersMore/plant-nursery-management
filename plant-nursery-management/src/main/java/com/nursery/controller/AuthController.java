package com.nursery.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nursery.entity.User;
import com.nursery.service.EmailService;
import com.nursery.service.SmsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private com.nursery.repository.UserRepository userRepository;

    @Autowired
    private SmsService smsService;
    
    @Autowired
    private EmailService emailService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;  // Inject PasswordEncoder

    // ✅ STEP-1: username/password → send OTP
    @PostMapping("/send-otp-login")
    @ResponseBody
    public String sendOtpLogin(@RequestParam String username,
                               @RequestParam String password,
                               HttpSession session) {

    	System.out.println("This AuthController.java /send-otp-login method");
        User user = userRepository.findByUsername(username);

        if (user == null) {
            return "INVALID";
        }

        // 🔐 verify password FIRST using Spring encoder
        if (!passwordEncoder.matches(password, user.getPassword())) {
            return "INVALID";
        }

        // ✅ generate OTP
        String otp = String.valueOf((int)(Math.random()*900000)+100000);

        // ✅ store in session (CRITICAL)
        session.setAttribute("OTP", otp);
        session.setAttribute("OTP_USER", username);
        session.setAttribute("OTP_EXPIRY",LocalDateTime.now().plusMinutes(5));

        System.out.println("LOGIN OTP = " + otp);
        

        try {
            // ✅ SEND EMAIL
            emailService.sendOtp(user.getEmailId(), otp);
        } catch (Exception e) {
            e.printStackTrace();
            // fallback
            System.out.println("OTP (fallback) = " + otp);
            return "OTP_CONSOLE";
        }

        System.out.println("This AuthController.java redirect to OTP_SENT");
        return "OTP_SENT";
    }
}
