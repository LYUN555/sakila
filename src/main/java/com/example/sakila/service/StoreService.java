package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StoreService {
	@Autowired
	private StoreMapper storeMapper;
	
	public List<Map<String, Object>> getStoreList(){
		return storeMapper.selectStoreList();
	}

	public int addStore(Store store) {
		return storeMapper.insertStore(store);
	}

	public boolean checkManagerExists(Store store) {
		boolean check = false;
		
		int count = storeMapper.countByStaffManager(store);
		if(count>0) {
			check = true;
		}
		return check;
		
	}
}
