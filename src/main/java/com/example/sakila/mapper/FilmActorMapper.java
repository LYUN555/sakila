package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	int insertFilmActor(FilmActor filmActor);
	
	int deleteFilmActor(FilmActor filmActor);

}
