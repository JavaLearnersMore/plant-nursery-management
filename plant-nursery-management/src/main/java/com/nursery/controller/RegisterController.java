package com.nursery.controller;

import com.nursery.entity.User;
import com.nursery.repository.UserRepository;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RegisterController {

    @Autowired
    private UserRepository repo;

    @Autowired
    private PasswordEncoder encoder;

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user) {

        user.setPassword(encoder.encode(user.getPassword()));
        user.setEnabled(true);
        user.setLoginAttempts(1);
        user.setLoginDateTime(LocalDateTime.now());
        user.setR_cre_time(LocalDateTime.now());
        user.setR_cre_id(user.getRole()==null?"":user.getRole());
        user.setR_mod_time(LocalDateTime.now());
        user.setR_mod_id(user.getRole()==null?"":user.getRole());

        repo.save(user);

        return "redirect:/login?registered=true";
    }
}
