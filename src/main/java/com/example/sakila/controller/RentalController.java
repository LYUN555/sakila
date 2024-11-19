package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CustomerService;
import com.example.sakila.service.RentalService;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	@Autowired
	private RentalService rentalService;
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/on/addRental")
	public String addRental(Model model,@RequestParam int inventoryId,@RequestParam(required = false) String searchName) {
		log.debug(searchName);
		if(searchName !=null && !searchName.equals("")) {
			// customerService 호출
			List<Customer> customerList = customerService.getCustomerListByName(searchName);
			model.addAttribute("searchName",searchName);
			model.addAttribute("customerList",customerList);
		}
		
		model.addAttribute("inventoryId",inventoryId);
		return "on/addRental";
	}
	
	@PostMapping("/on/addRental")
	public String addRental(Rental rental) {
		log.debug(rental.toString());
		
		Integer row = rentalService.addRental(rental);
		return "redirect:/on/customerOne?customerId="+rental.getCustomerId();
	}
}
