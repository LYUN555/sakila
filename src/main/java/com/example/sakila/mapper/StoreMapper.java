package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	// store 상세정보
	List<Map<String, Object>> selectStoreList();
	// 스토어 추가
	int insertStore(Store store);
	// 스태프 중복검증
	int countByStaffManager(Store store);
}
