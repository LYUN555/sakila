package com.example.sakila.vo;

import lombok.Data;

@Data
public class city {
	private int cityId; 
	private String city;
	private int countryId;
	private String lastUpdate;
}
