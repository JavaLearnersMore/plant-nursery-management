package com.nursery.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nursery.entity.User;
import com.nursery.repository.UserRepository;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import jakarta.servlet.http.HttpSession;

@Service
public class OtpService {

    @Value("${twilio.account.sid}")
    private String sid;

    @Value("${twilio.auth.token}")
    private String token;

    @Value("${twilio.phone.number}")
    private String fromNumber;

    private final UserRepository userRepository;

    public OtpService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    
    public void sendOtp(String username, String otp) {

    	User user = userRepository.findByUsername(username);

        if (user.getMobileNumber() == null || user.getMobileNumber().isBlank()) {
            throw new RuntimeException("User phone number is missing");
        }

        Twilio.init(sid, token);

        Message.creator(
                new PhoneNumber(user.getMobileNumber().trim()),
                new PhoneNumber(fromNumber),
                "Your Nursery OTP is: " + otp
        ).create();
    }
    
    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam String otp,
                            HttpSession session) {

        String sessionOtp = (String) session.getAttribute("LOGIN_OTP");
        Authentication auth =
                (Authentication) session.getAttribute("TEMP_AUTH");

        if (sessionOtp == null || !sessionOtp.equals(otp)) {
            return "redirect:/login?otpError=true";
        }

        // ✅ FINAL LOGIN (VERY IMPORTANT)
        SecurityContextHolder.getContext().setAuthentication(auth);

        session.removeAttribute("LOGIN_OTP");
        session.removeAttribute("TEMP_AUTH");

        return "redirect:/home";
    }

}
