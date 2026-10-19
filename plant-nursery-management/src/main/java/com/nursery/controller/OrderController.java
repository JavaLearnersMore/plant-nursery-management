package com.nursery.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nursery.entity.Order;
import com.nursery.entity.OrderItem;
import com.nursery.entity.Plant;
import com.nursery.repository.PlantRepository;
import com.nursery.service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private PlantRepository plantRepo;

    @Autowired
    private OrderService orderService;

    // OPEN FORM
    @GetMapping("/new")
    public String newOrder(
            @RequestParam(value="plantId", required=false) Long plantId,
            Model model){

        Order order = new Order();

        if(plantId != null){
            Plant plant = plantRepo.findById(plantId).orElse(null);
            if(plant != null){
                OrderItem item = new OrderItem();
                item.setPlant(plant);
                item.setQuantity(1);
                item.setPrice(plant.getPrice());
                item.setSubtotal(plant.getPrice());
                order.getItems().add(item);
            }
        }

        model.addAttribute("order", order);
        model.addAttribute("plants", plantRepo.findAll());
        model.addAttribute("selectedPlantId", plantId);

        return "order-form";
    }

    // SAVE ORDER
//    @PostMapping("/save")
//    public String saveOrder(@ModelAttribute Order order){
//        orderService.saveOrder(order);
//        return "redirect:/orders";
//    }
    
    @PostMapping("/save")
    public String saveOrder(@ModelAttribute Order order,RedirectAttributes ra) throws Exception {

        orderService.saveOrder(order);   // save order
//        String phone = order.getMobileNumber();
//
//        if(!phone.startsWith("91")){
//            phone = "91" + phone;	
//        }
//
//        // ✅ WhatsApp confirmation message
//        String msg = "Order Confirmed! Total ₹" + order.getFinalAmount();
//
//        String url = "https://wa.me/" + phone +
//                "?text=" + URLEncoder.encode(msg, "UTF-8");
//
//        // 👉 redirect customer to WhatsApp
//        return "redirect:" + url;
        
        ra.addFlashAttribute("successMsg", "✅ Order placed successfully!");

        return "redirect:/orders/new";
    }

    // LIST ORDERS
    @GetMapping
    public String listOrders(Model model){
        model.addAttribute("orders", orderService.getAll());
        return "orders";
    }
}