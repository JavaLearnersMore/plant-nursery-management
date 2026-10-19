package com.nursery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nursery.entity.User;
import com.nursery.repository.UserRepository;

@Service
public class UserService  implements UserDetailsService{

    @Autowired
    private UserRepository repository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // ✅ LOGIN METHOD (THIS WAS MISSING)
    public User login(String username, String rawPassword) {

        User optionalUser = repository.findByUsername(username);

        if (optionalUser == null) {
            return null;
        }

        // ✅ password match using BCrypt
        if (passwordEncoder.matches(rawPassword, optionalUser.getPassword())) {
            return optionalUser;
        }
        return null;
    }

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        User user = repository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.getPassword())
                .roles(user.getRole()) // ADMIN or USER
                .disabled(!user.isEnabled())
                .build();
    }


    // existing loadUserByUsername (keep it)
}
