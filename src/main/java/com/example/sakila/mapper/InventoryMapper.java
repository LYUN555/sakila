package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	
	// removeFilm
	Integer selectCountInventoryByFilm(Integer filmId);
	
	// inventoryList
	List<Map<String,Object>> selectInventoryListByStore(Map<String,Object> paramMap);
	
	// 리스트 갯수
	Integer selectInventoryTotalRowBystoreId(Map<String,Object> paramMap);
	
	// addInventory
	Integer insertInventory(Inventory inventory);
	
	// removeInventoryByKey
	Integer deleteInventoryBykey(Integer inventoryId);
}
