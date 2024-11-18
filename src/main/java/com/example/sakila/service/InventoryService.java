package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

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

	public List<Map<String,Object>> getInventoryListByStore(Integer storeId,Integer currentPage, Integer rowPerPage){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return inventoryMapper.selectInventoryListByStore(paramMap);
	}
	
	public Integer getLastPage(Integer storeId, Integer rowPerPage) {
		log.debug("getLastPage storeId:"+storeId);
		int totalRow = inventoryMapper.selectInventoryTotalRowBystoreId(storeId);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	public Integer removeInventoryByKey(Integer inventoryId) {
		return inventoryMapper.deleteInventoryBykey(inventoryId);
	}
}
