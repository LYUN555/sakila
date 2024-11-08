package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	int insertActorFile(ActorFile actorFile);
	
	// actirFilList
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	// removeActorFile
	int deleteActorFile(int actorFileId);
	
	// removeActorFile 삭제를 위한 actorFileOne
	ActorFile selectActorFileOne(int actorFileId);
	
	// removeActor
	int deleteActorFileByActor(int actorId);
}
