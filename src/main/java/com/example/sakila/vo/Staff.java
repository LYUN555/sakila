package com.example.sakila.vo;

import lombok.Data;

@Data
public class Staff {
	private int staffId;
	private String firstName;
	private String lastName;
	private int addressId; // fk
	private String email;
	private int storeId; // fk
	private int active; 
	private String username; 
	private String password; 
	private String lastUpdate; 
	
}
