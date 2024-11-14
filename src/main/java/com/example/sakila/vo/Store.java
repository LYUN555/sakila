package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	private Integer storeId;
	private Integer managerStaffId;
	private Integer addressId;
	private String lastUpdate;
}
