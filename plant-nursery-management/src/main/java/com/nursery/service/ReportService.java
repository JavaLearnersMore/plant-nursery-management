package com.nursery.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nursery.repository.ExpenseRepository;
import com.nursery.repository.OrderRepository;

@Service
public class ReportService {

    @Autowired
    OrderRepository orderRepo;

    @Autowired
    ExpenseRepository expenseRepo;

    public double totalSales(){
        return Optional.ofNullable(orderRepo.totalSales()).orElse(0.0);
    }

    public double totalExpenses(){
        return Optional.ofNullable(expenseRepo.totalExpenses()).orElse(0.0);
    }

    public double netProfit(){
        return totalSales() - totalExpenses();
    }
}