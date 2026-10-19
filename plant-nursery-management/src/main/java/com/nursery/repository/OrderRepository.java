package com.nursery.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nursery.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT SUM(o.totalAmount) FROM Order o WHERE o.status='PAID'")
    Double totalSales();
    
    List<Order> findByMobileNumberOrderByOrderDateDesc(String mobileNumber);
}
