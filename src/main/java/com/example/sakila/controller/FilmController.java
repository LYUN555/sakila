package com.example.sakila.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
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
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private InventoryService inventoryService;
	
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug("film :" + film.toString());
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		log.debug("actorList :" + actorList.toString());
		model.addAttribute("film",film);
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
		filmService.addFilm(filmForm);
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/filmList")
	public String filmList(Model model, @RequestParam(required = false) Integer categoryId, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		log.debug("categoryId : "+categoryId);
		List<Map<String, Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		log.debug("filmList : "+filmList);
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList : "+categoryList);
		int lastPage = filmService.getTotalCount(categoryId, rowPerPage);
		log.debug("currentPage : "+currentPage);
		log.debug("rowPerPage : "+rowPerPage);
		log.debug("lastPage : "+lastPage);
		log.debug("categoryId : "+categoryId);
		model.addAttribute("filmList", filmList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentCategoryId", categoryId);
		model.addAttribute("lastPage", lastPage);
		
		return "on/filmList";
	}
	
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model, @RequestParam Integer filmId) {
		
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if(count == 0 ) {
			Integer row = filmService.removeFilmByKey(filmId);
			if(row == 0 ) { // 삭제 실패시
				return "on/filmOne";
			}
			return "redirect:/on/filmList";
		}
		// 삭제 실패시 오류 메세지 넘기기
		String removeFilmMsg = "film이 인벤토리에 존재합니다";
		try {
			removeFilmMsg = URLEncoder.encode(removeFilmMsg, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/on/filmOne?filmId="+filmId+"&removeFilmMsg="+removeFilmMsg;
	}
}
