package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	List<Film> selectFilmTitleListByActor(int actorId);
	
	// film, language
	Map<String, Object> selectFilmOne(int filmId);
	
	int insertFilm(Film film);
	
	// actorOne 검색
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// category null 이거나 0 일때
	List<Map<String,Object>> selectFilmList(Map<String,Object> paramMap);
	int selectFilmCount();
	
	// categoryId 가 null이거나 0이 아닐떄
	List<Map<String,Object>> selectFilmListByCategory(Map<String,Object> paramMap);
	int selectFilmCountByCategory(Integer categoryId);

}
