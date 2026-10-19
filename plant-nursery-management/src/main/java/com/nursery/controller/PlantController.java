package com.nursery.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.nursery.entity.Plant;
import com.nursery.service.PlantService;

@Controller
public class PlantController {

    @Autowired
    private PlantService plantService;

    private final int PAGE_SIZE = 6;

    // ================= USER =================

    @GetMapping("/plants")
    public String plants(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String search,
            Model model) throws Exception {

        Page<Plant> plantPage =
                plantService.getAvailablePlants(page, PAGE_SIZE, search);

        model.addAttribute("plants", plantPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", plantPage.getTotalPages());
        model.addAttribute("search", search);

        return "plants";
    }

    // ================= ADMIN =================

    @GetMapping("/admin/plants")
    public String adminPlants(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String search,
            Model model) {

        Page<Plant> plantPage =
                plantService.getAllPlants(page, PAGE_SIZE, search);

        model.addAttribute("plants", plantPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", plantPage.getTotalPages());
        model.addAttribute("search", search);

        return "admin-plants";
    }

    // ✅ ADD page
    @GetMapping("/add-plant")
    public String addPlant(Model model) {
        model.addAttribute("plant", new Plant());
        return "add-plant";
    }

    // ✅ SAVE
    @PostMapping("/save-plant")
    public String savePlant(@ModelAttribute Plant plant,
                            @RequestParam("image") MultipartFile file)
            throws Exception {

        if (!file.isEmpty()) {

            String uploadDir = "src/main/webapp/static/images/";
            Path uploadPath = Paths.get(uploadDir);

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String fileName =System.currentTimeMillis() + "_" + file.getOriginalFilename();

            Files.copy(file.getInputStream(), uploadPath.resolve(fileName));

            plant.setImageUrl("/static/images/" + fileName);
            plant.setImageName(fileName);
        }
        
        

        plantService.save(plant);

        return "redirect:/admin/plants";
    }

    // ✅ EDIT
    @GetMapping("/edit-plant/{id}")
    public String editPlant(@PathVariable Long id, Model model) {
        model.addAttribute("plant", plantService.getById(id));
        return "add-plant";
    }

    // ✅ DELETE
    @GetMapping("/delete-plant/{id}")
    public String deletePlant(@PathVariable Long id) {
        plantService.delete(id);
        return "redirect:/admin/plants";
    }
    
    @GetMapping("/plants/price/{id}")
    @ResponseBody
    public double getPlantPrice(@PathVariable Long id){
        return plantService.getPlantPrice(id);
    }
}
