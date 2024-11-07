package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired
	private FilmService filmService;
	@Autowired
	private ActorService actorService;
	@Autowired
	private LanguageService languageService;
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug("film :" + film.toString());
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		log.debug("actorList :" + actorList.toString());
		model.addAttribute("film : ",film);
		model.addAttribute("actorList", actorList);
		return "on/filmOne";
	}
	
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		// languageList
		List<Language> languageList = languageService.getLanguageList();
		log.debug(languageList.toString());
		model.addAttribute("languageList",languageList);
		return "on/addFilm";
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		log.debug(filmForm.toString());
		// filmService : filmForm -< film
		return "redirect:/on/filmList";
	}
}
