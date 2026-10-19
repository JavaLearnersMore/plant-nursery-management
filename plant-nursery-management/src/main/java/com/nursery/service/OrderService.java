package com.nursery.service;

import com.nursery.entity.*;
import com.nursery.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepo;

    @Autowired
    private PlantRepository plantRepo;

    public void saveOrder(Order order){

        double total = 0;

        for(OrderItem item : order.getItems()) {

            if(item.getPlant() == null || item.getPlant().getId() == null) {
                continue; // skip empty rows
            }

            Plant plant = plantRepo.findById(item.getPlant().getId()).get();

            int qty = item.getQuantity();
            double price = plant.getPrice();

            item.setPlant(plant);
            item.setPrice(price);
            item.setSubtotal(price * qty);
            item.setOrder(order);

            // stock deduction
            plant.setStock(plant.getStock() - qty);
        }

        order.setTotalAmount(total);

        double gst = (order.getGst() != null) ? order.getGst() : 0;
        double discount = (order.getDiscount() != null) ? order.getDiscount() : 0;

        double gstAmount = total * gst / 100;
        double finalAmount = total + gstAmount - discount;

        order.setFinalAmount(finalAmount);
        order.setStatus("PAID");

        orderRepo.save(order);
    }

    public List<Order> getAll(){
        return orderRepo.findAll();
    }
}