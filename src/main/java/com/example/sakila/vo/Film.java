package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId;
	private String title;
	private String description; // null 
	private Integer releaseYear; // null
	private int languageId;
	private Integer originalLanguageId; // null
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // null
	private double replacementCost;
	private String rating;
	private String specialFeatures; // null
	private String lastUpdate;
	
}
