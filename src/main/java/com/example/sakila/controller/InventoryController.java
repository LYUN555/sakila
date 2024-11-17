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
	
	// 인벤토리 페이징 구현해보기 이전...12345~10...다음
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model, @RequestParam Integer storeId, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		// 리스트 조회
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		int totalRow = inventoryService.getTotalRow(storeId);
		// 페이징 계산에 필요한 변수
		int startPage = (currentPage-1)/10*10+1; //1..11.. 21.. 31..
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("inventoryList",inventoryList);
		model.addAttribute("storeId",storeId);
		return "on/inventoryList";
	}
}
