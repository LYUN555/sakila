package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.vo.Address;

@Service
@Transactional
public class AddressService {
	@Autowired
	private AddressMapper addressMapper;
	
	public List<Address> getAddressListByWorld(String searchAddress){
		return addressMapper.selectAddressListByWord(searchAddress);
	}
}
