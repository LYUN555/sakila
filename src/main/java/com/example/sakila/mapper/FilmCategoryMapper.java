package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	// 필름 삭제시
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	// 카테고리 삭제했을때
	Integer deleteFilmCategoryByCategory(Integer categoryId);
	
	List<Map<String,Object>> selectFilmCategoryListByFilm(Integer filmId);
}
