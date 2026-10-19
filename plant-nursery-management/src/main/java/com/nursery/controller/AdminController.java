package com.nursery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.nursery.entity.User;
import com.nursery.repository.UserRepository;
import com.nursery.service.ReportService;

@Controller
public class AdminController {

    
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private ReportService reportService;
    
    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {
    	model.addAttribute("sales", reportService.totalSales());
        model.addAttribute("expenses", reportService.totalExpenses());
        model.addAttribute("profit", reportService.netProfit());
        return "admin-dashboard";
    }

    // Show all users to admin
    @GetMapping("/users")
    public String showUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "admin-users"; // admin-users.jsp
    }

    // Delete user by ID
    @GetMapping("/delete-user/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            userRepository.delete(user);
        }
        return "redirect:/admin-users"; // redirect back to the list of users
    }

    // Optional: Admin dashboard to manage other admin functionalities
    @GetMapping("/dashboard")
    public String adminDashboard() {
        return "admin-dashboard"; // admin-dashboard.jsp
    }
    
 // ================= EDIT USER PAGE =================
    @GetMapping("/update-user/{id}")
    public String editUser(@PathVariable Long id, Model model) {

        User user = userRepository.findById(id).orElse(null);

        if (user == null) {
            return "redirect:/admin/users";
        }

        model.addAttribute("user", user);
        return "admin-update-user"; // JSP name
    }

    // ================= UPDATE USER =================
    @PostMapping("/update-user")
    public String updateUser(@ModelAttribute User user) {

        User existingUser = userRepository.findById(user.getId()).orElse(null);

        if (existingUser != null) {
            existingUser.setFullName(user.getFullName());
            existingUser.setEmailId(user.getEmailId());
            existingUser.setMobileNumber(user.getMobileNumber());
            existingUser.setRole(user.getRole());
            existingUser.setEnabled(user.isEnabled());

            userRepository.save(existingUser);
        }

        return "redirect:/admin/users";
    }
}
