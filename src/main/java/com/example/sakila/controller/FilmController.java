package com.example.sakila.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;
import com.example.sakila.vo.Page;

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
	@Autowired
	private FilmCategoryService filmCategoryService;
	
	
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam Integer filmId, @RequestParam(required = false) String searchName) {
		
		// 1)
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug("film :" + film.toString());
		// 2)
		List<Category> allCategoryList = categoryService.getCategoryList();
		log.debug("categoryList :" + allCategoryList.toString());
		// 3)
		List<Map<String, Object>> filmCategoryList = filmCategoryService.getFilmCategoryListByFilm(filmId);
		log.debug("filmCategoryList :" + filmCategoryList.toString());
		// 4) 배우이름 검색
		List<Actor> searchActorList = null;
		if(searchName != null) {
			searchActorList = actorService.getActorListByActor(searchName);
		}
		// 5)
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		log.debug("actorList :" + actorList.toString());
		model.addAttribute("film",film); // 1
		model.addAttribute("allCategoryList",allCategoryList); // 2
		model.addAttribute("filmCategoryList",filmCategoryList); // 3
		model.addAttribute("searchActorList",searchActorList); // 4
		model.addAttribute("actorList", actorList); // 5
		return "on/filmOne";
	}
	
	// 영화 추가
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
	// 영화 리스트
	@GetMapping("/on/filmList")
	public String filmList(Model model,@RequestParam(required = false) String searchFilm, @RequestParam(required = false) Integer categoryId, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		log.debug("categoryId : "+categoryId);
		log.debug("searchFilm : "+searchFilm);
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setRowPerPage(rowPerPage);
		page.setNumPerPage(10);
		
		List<Map<String, Object>> filmList = filmService.getFilmList(categoryId, page, searchFilm);
		log.debug("filmList : "+filmList);
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList : "+categoryList);
		int lastPage = filmService.getTotalCount(categoryId, page, searchFilm);
		log.debug("currentPage : "+currentPage);
		log.debug("rowPerPage : "+rowPerPage);
		log.debug("lastPage : "+lastPage);
		log.debug("categoryId : "+categoryId);
		model.addAttribute("searchFilm", searchFilm);
		model.addAttribute("filmList", filmList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", page.getStartPage());
		model.addAttribute("endPage", page.getEndPage());
		model.addAttribute("currentCategoryId", categoryId);
		model.addAttribute("lastPage", lastPage);
		
		return "on/filmList";
	}
	// 영화 삭제
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model, @RequestParam Integer filmId) {
		
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if(count == 0 ) {
			filmService.removeFilmByKey(filmId);
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
	
	// 영화 수정 get
	@GetMapping("/on/modifyFilm")
	public String modifyFilm(Model model, @RequestParam Integer filmId) {
		log.debug("filmId : "+filmId);
		// 필름 목록 불러오기
		Map<String, Object> film = filmService.getFilmOne(filmId);
		// 데이트 형식으로 자동변환 된 releaseYear 받아옴
		Date releaseDate = (Date)film.get("releaseYear");
		if(releaseDate != null) {
			// 년도로 변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
	        String releaseYear = sdf.format(releaseDate);
	        
			film.put("releaseYear", releaseYear);
		}
		// specialFeatures 값들 불러오기
		String specialFeatures = (String) film.get("specialFeatures");
		if(specialFeatures != null) {
			// 쉼표 기준으로 나눔
			List<String> specialFeature = Arrays.asList(specialFeatures.split(","));
			model.addAttribute("specialFeature",specialFeature);
		}
		log.debug("film : "+film);
		// languageList
		List<Language> languageList = languageService.getLanguageList();
		log.debug("languageList : " + languageList.toString());
		
		model.addAttribute("filmId",filmId);
		model.addAttribute("languageList",languageList);
		model.addAttribute("film",film);
		return "on/modifyFilm";
	}
	// 영화 수정 post
	@PostMapping("/on/modifyFilm")
	public String modifyFilm(FilmForm filmForm) {
		log.debug("filmForm:"+filmForm.toString());
		filmService.modifyFilm(filmForm);
		return "redirect:/on/filmOne?filmId="+filmForm.getFilmId();
	}
}
