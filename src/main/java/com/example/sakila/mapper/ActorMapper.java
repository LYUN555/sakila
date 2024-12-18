package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	int insertActor(Actor actor);
	
	// actorList
	List<Actor> selectActorList(Map<String, Object> map);

	int selectActorCount(String searchWord);
	
	Actor selectActorOne(int ActorId);
	
	List<Actor> selectActorListByFilm(int filmId);
	
	int updateActor(Actor actor);
	
	int deleteActor(int actorId);
	
	// filmOne: searchName 검색결과
	List<Actor> selectActorListByActor(String searchWord);
}
