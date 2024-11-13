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
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private AddressService addressService;
	
	@GetMapping("/on/storeList")
	public String selectStoreList(Model model) {
		List<Map<String,Object>> storeList = storeService.getStoreList();
		
		log.debug("storeList :"+storeList);
		model.addAttribute("storeList", storeList);
		return "on/storeList";
	}
	
	@GetMapping("/on/addStore")
	public String addStore(Model model, @RequestParam(defaultValue = "") String searchAddress) {
		
		List<Map<String,Object>> storeList = storeService.getStoreList();
		log.debug("storeList :"+storeList);
		if(!searchAddress.equals("")) {
			List<Address> addressList = addressService.getAddressListByWorld(searchAddress);
			log.debug("addressList : "+addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		model.addAttribute("storeList", storeList);
		return "on/addStore";
	}
	
	@PostMapping("/on/addStore")
	public String addStore(Store store) {
		log.debug(store.toString());
		// 매니저스태프 중복체크
		boolean checkManagerExists = storeService.checkManagerExists(store);
		if(checkManagerExists) { // 중복이 없을시
			int row = storeService.addStore(store);
			if(row == 0) { //추가 실패
				return "on/addStore";
			}
			// 추가 성공후 리스트로
			return "on/storeList";
		}
		return "on/addStore";
	}
	
}
