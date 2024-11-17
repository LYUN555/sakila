package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;

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
	
	public int getTotalRow(Integer storeId) {
		return inventoryMapper.selectInventoryTotalRowBystoreId(storeId);
	}
}
