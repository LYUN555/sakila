package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	int insertFilmActor(FilmActor filmActor);
	
	int deleteFilmActor(FilmActor filmActor);
	
	// 배우 삭제시 배우와 관련된 출연작 전부 삭제
	int deleteFileByActor(int actorId);
}
