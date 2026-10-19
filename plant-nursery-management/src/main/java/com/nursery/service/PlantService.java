package com.nursery.service;

import com.nursery.entity.Plant;
import com.nursery.repository.PlantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

@Service
public class PlantService {

    @Autowired
    private PlantRepository repository;

    // ================= ADMIN =================

    public Page<Plant> getAllPlants(int page, int size, String search) {

        PageRequest pageable = PageRequest.of(page, size);

        if (search != null && !search.isEmpty()) {
            return repository.findByNameContainingIgnoreCase(search, pageable);
        }

        return repository.findAll(pageable);
    }

    // ================= USER =================

    public Page<Plant> getAvailablePlants(int page, int size, String search) {

        PageRequest pageable = PageRequest.of(page, size);

        if (search != null && !search.isEmpty()) {
            return repository.findByNameContainingIgnoreCase(search, pageable);
        }

        return repository.findByStockGreaterThan(0, pageable);
    }

    // ================= COMMON =================

    public Plant save(Plant plant) {
        return repository.save(plant);
    }

    public Plant getById(Long id) {
        return repository.findById(id).orElse(null);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
    
    public double getPlantPrice(@PathVariable Long id){
        return repository.findById(id).get().getPrice();
    }
}
