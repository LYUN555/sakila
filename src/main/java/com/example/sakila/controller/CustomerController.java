package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.CustomerService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private AddressService addressService;

	@GetMapping("/on/addCustomer")
	public String addCustomer(Model model, @RequestParam(required = false) String searchWord) {
		// storeList
		List<Map<String, Object>> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		// addressList
		if (searchWord != null && !searchWord.equals("")) {
			List<Address> addressList = addressService.getAddressListByWorld(searchWord);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("addressList", addressList);
		}

		return "on/addCustomer";
	}

	@PostMapping("/on/addCustomer")
	public String addCustomer(Customer customer) {
		log.debug("customer :" + customer);
		// 고객추가
		customerService.addCustomer(customer);
		return "redirect:/on/customerList";
	}

	@GetMapping("/on/customerList")
	public String customerList(Model model, @RequestParam(required = false) String searchName,
			@RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(defaultValue = "10") Integer rowPerPage) {

		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage); 
		page.setNumPerPage(10);

		Map<String, Object> resultMap = customerService.getCustomerList(page, searchName);
		int lastPage = customerService.getLastPage(page, searchName);
		int numPerPage = page.getNumPerPage();
		model.addAttribute("searchName", searchName);
		model.addAttribute("currentPage", currentPage);

		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", resultMap.get("startPage"));
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("endPage", resultMap.get("endPage"));
		model.addAttribute("customerList", resultMap.get("customerList"));
		return "on/customerList";
	}

	@GetMapping("/on/customerOne")
	public String customerOne(Model model, @RequestParam Integer customerId) {
		Map<String, Object> customer = customerService.getSelectCustomerOne(customerId);
		List<Map<String, Object>> rentalList = customerService.getSelectCustomerOneByRentalList(customerId);
		log.debug("rentalList:" + rentalList.toString());
		model.addAttribute("rentalList", rentalList);
		model.addAttribute("customer", customer);
		return "on/customerOne";
	}

}
