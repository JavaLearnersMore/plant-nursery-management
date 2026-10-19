package com.nursery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {
    	System.out.println("login controller...........");
        return "login"; // maps to /WEB-INF/jsp/login.jsp
    }
}
