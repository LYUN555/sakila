package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	// 고객 추가
	Integer insertCustomer(Customer customer);
	// 전체 페이지
	List<Customer> selectCustomerList(Map<String,Object> paramMap);
	Integer getTotalRow(String searchName);
	
	// addRental
	List<Customer> selectCustomerListByName(String searchName);
	
	//customerOne 렌탈 리스트
	List<Map<String,Object>> selectCustomerOneByRentalList(Integer customerId);
	// customerOne 개인정보
	Map<String, Object> selectCustomerOne(Integer customerId);

}
