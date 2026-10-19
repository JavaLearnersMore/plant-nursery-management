package com.nursery.security;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.nursery.service.OtpService;

@Component
public class CustomAuthSuccessHandler implements AuthenticationSuccessHandler {

    private final OtpService otpService;

    public CustomAuthSuccessHandler(OtpService otpService) {
        this.otpService = otpService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication)
            throws IOException, ServletException {

        String username = authentication.getName();

        // ✅ generate OTP
        String otp = String.valueOf(100000 + new Random().nextInt(900000));

        HttpSession session = request.getSession();
        session.setAttribute("OTP", otp);
        session.setAttribute("OTP_EXPIRY", LocalDateTime.now().plusMinutes(2));
        session.setAttribute("OTP_USER", username);

        // ✅ send SMS
        otpService.sendOtp(username, otp);

        // redirect to OTP page
        response.sendRedirect("/otp");
    }
}
