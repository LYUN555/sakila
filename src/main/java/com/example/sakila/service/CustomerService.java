package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

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
	public Map<String, Object> getCustomerList(Integer currentPage, Integer rowPerPage, String searchName) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchName", searchName);
		List<Customer> customerList = customerMapper.selectCustomerList(paramMap);

		int startPage = (currentPage - 1) / 10 * 10 + 1;
		int numPerPage = 10;
		int nextPage = startPage + (numPerPage - 1);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("startPage", startPage);
		resultMap.put("nextPage", nextPage);
		resultMap.put("customerList", customerList);

		return resultMap;
	}

	// 전체 페이지
	public Integer getLastPage(Integer rowPerPage, String searchName) {
		int totalRow = customerMapper.getTotalRow(searchName);

		int lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage++;
		}

		return lastPage;
	}
	
	public List<Customer> getCustomerListByName(String searchName){
		return customerMapper.selectCustomerListByName(searchName);
	}


}
