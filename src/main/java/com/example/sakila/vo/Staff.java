package com.example.sakila.vo;

import lombok.Data;

@Data
public class Staff {
	private int staffId; //pk
	private String firstName;
	private String lastName;
	private int address_id; // fk
	private String email;
	private int store_id; // fk
	private int active; 
	private int username; 
	private String password; 
	private int lastUpdate; 
	
}
