package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;

	public Integer addCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}

	// 전체 페이지
	public Map<String, Object> getCustomerList(Page page, String searchName) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", page.getBeginRow());
		paramMap.put("rowPerPage", page.getRowPerPage());
		paramMap.put("searchName", searchName);
		List<Customer> customerList = customerMapper.selectCustomerList(paramMap);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("startPage", page.getStartPage());
		resultMap.put("endPage", page.getEndPage());
		resultMap.put("customerList", customerList);

		return resultMap;
	}

	// 전체 페이지
	public Integer getLastPage(Page page, String searchName) {
		int totalRow = customerMapper.getTotalRow(searchName);

		int lastPage = page.getLastPage(totalRow);

		return lastPage;
	}
	
	public List<Customer> getCustomerListByName(String searchName){
		return customerMapper.selectCustomerListByName(searchName);
	}
	
	// 고객정보 대여리스트
	public List<Map<String,Object>> getSelectCustomerOneByRentalList(Integer customerId) {
		return customerMapper.selectCustomerOneByRentalList(customerId);
	}
	// 고객 정보
	public Map<String,Object> getSelectCustomerOne(Integer customerId) {
		return customerMapper.selectCustomerOne(customerId);
	}


	


}
