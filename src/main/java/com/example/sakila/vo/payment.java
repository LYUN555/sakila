package com.example.sakila.vo;

import lombok.Data;

@Data
public class payment {
	private int paymentId;
	private int customerId;
	private int staffId;
	private int rentalId;
	private int amount;
	private String paymentDate;
	private String lastupdate;
}
