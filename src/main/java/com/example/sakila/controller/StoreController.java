package com.example.sakila.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.StaffService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private StaffService staffService;

	@GetMapping("/on/storeList")
	public String selectStoreList(Model model) {
		List<Map<String, Object>> storeList = storeService.getStoreList();

		log.debug("storeList :" + storeList);
		model.addAttribute("storeList", storeList);
		return "on/storeList";
	}

	// 스토어 추가
	@GetMapping("/on/addStore")
	public String addStore(Model model, @RequestParam(defaultValue = "") String searchAddress) {

		List<Map<String, Object>> storeList = storeService.getStoreList();
		log.debug("storeList :" + storeList);
		if (!searchAddress.equals("")) {
			List<Address> addressList = addressService.getAddressListByWorld(searchAddress);
			log.debug("addressList : " + addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		// 매니저 스태프 지정할때 가져올 스태프 리스트
		List<Staff> staffList = staffService.getStaffList();
		log.debug("staffList :" + staffList);

		model.addAttribute("staffList", staffList);
		model.addAttribute("storeList", storeList);
		return "on/addStore";
	}

	@PostMapping("/on/addStore")
	public String addStore(Store store) {
		log.debug(store.toString());
		// 매니저스태프 중복체크
		boolean checkManagerExists = storeService.checkManagerExists(store);
		if (checkManagerExists) { // 중복이 있을시 
			// 추가 실패 --> 다시 추가 폼으로
			String msg = "";
			try {
				msg = URLEncoder.encode("이미 지정된 매니저 입니다", "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/on/addStore?msg="+msg;
		}
		// 추가 성공후 리스트로
		storeService.addStore(store);
		return "redirect:/on/storeList";
	}
}
