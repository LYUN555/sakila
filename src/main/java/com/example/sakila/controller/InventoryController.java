package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private FilmService filmService;
	
	// 인벤토리 페이징 구현해보기 이전...12345~10...다음
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model, @RequestParam Integer storeId, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		// 리스트 조회
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		// 페이징 계산에 필요한 변수
		int startPage = (currentPage-1)/10*10+1; //1..11.. 21.. 31..
		int endPage = startPage+9;
		int lastPage = inventoryService.getLastPage(storeId, rowPerPage);
		log.debug("lastPage : "+lastPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("inventoryList",inventoryList);
		model.addAttribute("storeId",storeId);
		return "on/inventoryList";
	}
	
	@GetMapping("/on/addInventory")
	public String addInventory(Model model, @RequestParam Integer storeId, @RequestParam(required = false) String searchWord) {
		model.addAttribute("storeId",storeId);
		
		if(searchWord != null && !searchWord.equals("")) { // 영화 검색
			List<Film> filmList = filmService.getFilmListByTitle(searchWord);
			model.addAttribute("filmList",filmList);
			model.addAttribute("searchWord",searchWord);
		}
		return "on/addInventory";
	}
	
	@PostMapping("/on/addInventory")
	public String addInventory(Inventory inventory) {
		inventoryService.addInventory(inventory);
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
	
	@GetMapping("/on/removeInventoryByKey")
	public String removeInventoryByKey(Inventory inventory) {
		inventoryService.removeInventoryByKey(inventory.getInventoryId());
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
}
