package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	Integer insertCustomer(Customer customer);

	List<Customer> selectCustomerList(Map<String,Object> paramMap);

	Integer getTotalRow();
}
