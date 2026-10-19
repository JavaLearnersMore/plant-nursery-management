package com.nursery.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nursery.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OtpController {

	@Autowired
	UserService userService;
	
    // ✅ OTP page
    @GetMapping("/otp")
    public String otpPage() {
    	System.out.println("This OtpController.java otp method");
        return "otp";
    }

    // ✅ verify OTP
    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam String otp,
                            HttpServletRequest request,
                            HttpSession session) {

        System.out.println("This OtpController.java.... /verify-otp");

        String sessionOtp = (String) session.getAttribute("OTP");
        String username = (String) session.getAttribute("OTP_USER");
        LocalDateTime expiry =
                (LocalDateTime) session.getAttribute("OTP_EXPIRY");

        // ❌ session expired
        if (sessionOtp == null || expiry == null) {
            return "redirect:/login?expired";
        }

        // ❌ OTP expired
        if (LocalDateTime.now().isAfter(expiry)) {
            return "redirect:/login?expired";
        }

        // ❌ wrong OTP
        if (!sessionOtp.equals(otp)) {
            return "redirect:/login?otpError";
        }

        // ✅ LOAD USER
        UserDetails userDetails =
                userService.loadUserByUsername(username);

        // ✅ CREATE AUTH TOKEN
        UsernamePasswordAuthenticationToken auth =
                new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities());

        // ✅ SET INTO SECURITY CONTEXT
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(auth);

        // ✅ VERY IMPORTANT — STORE IN SESSION (THIS FIXES YOUR ISSUE)
        session.setAttribute(
                HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
                context);

        // 🧹 cleanup
        session.removeAttribute("OTP");
        session.removeAttribute("OTP_EXPIRY");

        System.out.println("Redirecting to home page..............");
        return "redirect:/home"; // ✅ WILL WORK NOW
    }


}
