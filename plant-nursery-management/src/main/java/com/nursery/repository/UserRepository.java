package com.nursery.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nursery.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	List<User> findAll(); // Fetch all users

    User findByUsername(String username);

    Optional<User> findByMobileNumber(String mobile_number); // for OTP flow
}
