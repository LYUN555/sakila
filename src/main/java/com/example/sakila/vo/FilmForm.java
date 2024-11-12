package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
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
	private List<String> specialFeatures;
	//private String[] specialFeatures;
	
	
}
