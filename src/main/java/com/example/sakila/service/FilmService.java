package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
