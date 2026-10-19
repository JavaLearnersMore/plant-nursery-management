package com.nursery.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "expenses")
public class Expense {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String category;

    private Double amount;

    private LocalDate expenseDate;

    private String notes;

    private String createdBy;

    // getters & setters
}