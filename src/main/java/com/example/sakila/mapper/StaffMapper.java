package com.example.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// staffOne
	Map<String,Object> selectStaffOne(int staffId);
	
	// login
	Staff login(Staff staff);
}
