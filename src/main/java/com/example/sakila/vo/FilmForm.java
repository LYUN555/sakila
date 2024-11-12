package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private Integer filmId;
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
	private List<String> specialFeatures;
	//private String[] specialFeatures;
	
	
}
