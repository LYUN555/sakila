package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	
	@Autowired
	private FilmMapper filmMapper;
	@Autowired
	private FilmActorMapper filmActorMapper;
	@Autowired
	private FilmCategoryMapper filmCategoryMapper;
	
	// /on/actorOne
	public List<Film> getFilmTitleListByActor(int actorId) {
		return filmMapper.selectFilmTitleListByActor(actorId);
	}
	
	public Map<String, Object> getFilmOne(int filmId) {
		return filmMapper.selectFilmOne(filmId);
	}
	
	public int addFilm(FilmForm filmForm) {
		Film film = new Film();
		// filmForm --> film
		film.setTitle(filmForm.getTitle());
		if(filmForm.getDescription().equals("")){
			film.setDescription(null);
		} else {
			film.setDescription(filmForm.getDescription());
		}
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		} else {
			// specialFeatures 배열 -> 문자열
			String specialFeatures = filmForm.getSpecialFeatures().get(0);
			for(int i = 1; filmForm.getSpecialFeatures().size()>i ; i++) {
				specialFeatures += ","+filmForm.getSpecialFeatures().get(i);
			}
			film.setSpecialFeatures(specialFeatures);
		}
		log.debug(film.toString());
		return filmMapper.insertFilm(film);
	}
	
	public List<Film> getFilmListByTitle(String searchTitle){
		return filmMapper.selectFilmListByTitle(searchTitle);
	}
	
	// 필름 리스트
	public List<Map<String,Object>> getFilmList(Integer categoryId, int currentPage, int rowPerPage, String searchFilm){
		Map<String, Object> paramMap = new HashMap<>();
		if(categoryId == null || categoryId == 0) {
			paramMap.put("categoryId", null);
		} else {
			paramMap.put("categoryId", categoryId);
		}
		if(searchFilm != null) {
			paramMap.put("searchFilm", searchFilm);
		}
		int beginRow = (currentPage-1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		if(paramMap.get("categoryId") == null) {
			return filmMapper.selectFilmList(paramMap);
		} else {
			return filmMapper.selectFilmListByCategory(paramMap);
		}
	}
	// 필름 리스트 페이징
	public int getTotalCount(Integer categoryId, int rowPerPage, String searchFilm) {
		int count = 0;
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("categoryId", categoryId);
		paramMap.put("searchFilm", searchFilm);
		
		if(categoryId == null || categoryId == 0) {
			count = filmMapper.selectFilmCount(searchFilm);
		} else {
			count = filmMapper.selectFilmCountByCategory(paramMap);
		}
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	// 필름 삭제
	public void removeFilmByKey(Integer filmId) {
		// 필름 카테고리 삭제
		filmCategoryMapper.deleteFilmCategoryByCategory(filmId);
		// 필름 배우 삭제
		filmActorMapper.deleteFilmActorByFilm(filmId);
		// 필름 삭제
		filmMapper.deleteFilmByKey(filmId);
		
	}
	
	// 필름 수정
	public int modifyFilm(FilmForm filmForm) {
		Film film = new Film();
		// filmForm --> film
		film.setFilmId(filmForm.getFilmId());
		film.setTitle(filmForm.getTitle());
		if(filmForm.getDescription().equals("")){
			film.setDescription(null);
		} else {
			film.setDescription(filmForm.getDescription());
		}
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		} else {
			// specialFeatures 배열 -> 문자열
			String specialFeatures = filmForm.getSpecialFeatures().get(0);
			for(int i = 1; filmForm.getSpecialFeatures().size()>i ; i++) {
				specialFeatures += ","+filmForm.getSpecialFeatures().get(i);
			}
			film.setSpecialFeatures(specialFeatures);
		}
		log.debug(film.toString());
		
		return filmMapper.updateFilm(film);
	}

}
