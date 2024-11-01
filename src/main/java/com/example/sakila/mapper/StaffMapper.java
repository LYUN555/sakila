package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// staffOne
	Staff selectStaffOne(int staffId);
	
	// login
	Staff login(Staff staff);
}
