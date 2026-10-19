package com.nursery.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "full_name")
    private String fullName;
    private String username;
    private String password;
    private String role;
    private boolean enabled = true;
    @Column(name = "mobile_number")
    private String mobileNumber;
    @Column(name = "email_id")
    private String emailId;
    private String address;
    
    @Column(name = "login_attempts")
    private int loginAttempts;
    
    @Column(name = "login_time")
    private LocalDateTime loginDateTime;	
   
    private LocalDateTime r_cre_time;
    
    private String r_cre_id;
    
    private LocalDateTime r_mod_time;
    
    private String r_mod_id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getLoginAttempts() {
		return loginAttempts;
	}

	public void setLoginAttempts(int loginAttempts) {
		this.loginAttempts = loginAttempts;
	}

	public LocalDateTime getLoginDateTime() {
		return loginDateTime;
	}

	public void setLoginDateTime(LocalDateTime loginDateTime) {
		this.loginDateTime = loginDateTime;
	}

	public LocalDateTime getR_cre_time() {
		return r_cre_time;
	}

	public void setR_cre_time(LocalDateTime r_cre_time) {
		this.r_cre_time = r_cre_time;
	}

	public String getR_cre_id() {
		return r_cre_id;
	}

	public void setR_cre_id(String r_cre_id) {
		this.r_cre_id = r_cre_id;
	}

	public LocalDateTime getR_mod_time() {
		return r_mod_time;
	}

	public void setR_mod_time(LocalDateTime r_mod_time) {
		this.r_mod_time = r_mod_time;
	}

	public String getR_mod_id() {
		return r_mod_id;
	}

	public void setR_mod_id(String r_mod_id) {
		this.r_mod_id = r_mod_id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", fullName=" + fullName + ", username=" + username + ", password=" + password
				+ ", role=" + role + ", enabled=" + enabled + ", mobileNumber=" + mobileNumber + ", emailId=" + emailId
				+ ", address=" + address + ", loginAttempts=" + loginAttempts + ", loginDateTime=" + loginDateTime
				+ ", r_cre_time=" + r_cre_time + ", r_cre_id=" + r_cre_id + ", r_mod_time=" + r_mod_time + ", r_mod_id="
				+ r_mod_id + "]";
	}
	
}
