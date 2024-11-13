package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	@Autowired
	private InventoryService inventoryService;
	
	// 인벤토리 페이징 구현해보기 이전...12345...다음
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model, @RequestParam Integer storeId, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		int totalRow = inventoryService.getTotalRow(storeId);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage",rowPerPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("inventoryList",inventoryList);
		model.addAttribute("storeId",storeId);
		return "on/inventoryList";
	}
}
