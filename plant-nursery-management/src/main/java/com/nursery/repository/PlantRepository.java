package com.nursery.repository;

import com.nursery.entity.Plant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlantRepository extends JpaRepository<Plant, Long> {

    // 🔍 search with pagination
    Page<Plant> findByNameContainingIgnoreCase(String name, Pageable pageable);

    // ✅ only available plants (user side)
    Page<Plant> findByStockGreaterThan(int stock, Pageable pageable);
    
}
