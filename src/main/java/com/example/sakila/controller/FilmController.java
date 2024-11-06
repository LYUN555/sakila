package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.sakila.service.FilmService;

public class FilmController {

	@Autowired
	FilmService filmService;
	
	
}
