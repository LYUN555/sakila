package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private Integer filmId;
	private String title;
	private String description; // null 
	private Integer releaseYear; // null
	private Integer languageId;
	private Integer originalLanguageId; // null
	private Integer rentalDuration;
	private Double rentalRate;
	private Integer length; // null
	private Double replacementCost;
	private String rating;
	private String specialFeatures; // null
	private String lastUpdate;
	
}
