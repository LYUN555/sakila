package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.vo.FilmCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmCategoryController {
	@Autowired
	private FilmCategoryService filmcategoryService;

	@PostMapping("/on/addFilmCategory")
	public String addFilmCategory(FilmCategory filmCategory) {
		log.debug(filmCategory.toString());
		
		// 나중에 유효성 검증 해야됨(중복)
		int row = filmcategoryService.addFilmCategory(filmCategory);
		return "redirect:/on/filmOne?filmId="+filmCategory.getFilmId();
	}
	
	@GetMapping("/on/removeFilmCategory")
	public String removeFilmCategory(FilmCategory filmCategory) {
		log.debug(filmCategory.toString());
		int row = filmcategoryService.removeFilmCategory(filmCategory);
		
		return "redirect:/on/filmOne?filmId="+filmCategory.getFilmId();
	}
}

