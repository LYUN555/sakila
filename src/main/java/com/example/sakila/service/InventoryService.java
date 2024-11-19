package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;
import com.example.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InventoryService {
	@Autowired
	private InventoryMapper inventoryMapper;
	
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}

	public List<Map<String,Object>> getInventoryListByStore(Integer storeId, Page page, String searchInventory){
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", page.getBeginRow());
		paramMap.put("rowPerPage", page.getRowPerPage());
		paramMap.put("searchInventory", searchInventory);
		
		log.debug("paramMap : "+paramMap);
		return inventoryMapper.selectInventoryListByStore(paramMap);
	}
	
	public Integer getLastPage(Integer storeId, Page page, String searchInventory) {
		log.debug("getLastPage storeId:"+storeId);
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("searchInventory", searchInventory);
		int totalRow = inventoryMapper.selectInventoryTotalRowBystoreId(paramMap);
		int lastPage = page.getLastPage(totalRow);
		return lastPage;
	}
	
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	public Integer removeInventoryByKey(Integer inventoryId) {
		return inventoryMapper.deleteInventoryBykey(inventoryId);
	}
}
