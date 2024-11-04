package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	private int storeId;
	private int managerStaffId;
	private int addressId;
	private String lastUpdate;
}
