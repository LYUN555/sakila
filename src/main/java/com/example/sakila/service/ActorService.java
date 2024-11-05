package com.example.sakila.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorService {
	@Autowired
	private ActorMapper actorMapper;
	@Autowired
	private ActorFileMapper actorFileMapper;

	public void addActor(ActorForm actorForm, String path) {
		Actor actor = new Actor();
		actor.setFirstName(actorForm.getFirstName());
		actor.setLastName(actorForm.getLastName());
		
		int row1 = actorMapper.insertActor(actor); // actorId = 0;
		int actorId = actor.getActorId(); // actorId = mybatis 실행후 숫자 채워짐
		
		if(row1 == 1 && actorForm.getActorFile() != null) {
			// 파일 입력
			List<MultipartFile> list = actorForm.getActorFile();
			for(MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();
				actorFile.setActorId(actorId);
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());
				String fileName = UUID.randomUUID().toString().replace("-", "");
				actorFile.setFilename(fileName);
				int dotInx = mf.getOriginalFilename().lastIndexOf(".");
				String originname = mf.getOriginalFilename().substring(0,dotInx);
				String ext = mf.getOriginalFilename().substring(dotInx+1);
				actorFile.setOriginname(originname);
				actorFile.setExt(ext);
				
				int row2 = actorFileMapper.insertActorFile(actorFile);
				if(row2 == 1) {
					// 물리적 파일 저장
					// request.getRealPath("/upload")
					try {
						mf.transferTo(new File(path+fileName +"."+ext));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// RuntimeException을 인위적으로 발생
						throw new RuntimeException();
					}
				}
			}
		}
		
	}
}
