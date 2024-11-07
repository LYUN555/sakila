package com.example.sakila.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorFileService {
	@Autowired
	private ActorFileMapper actorFileMapper;
	
	// actorOneList
	public List<ActorFile> getActorFileListByActor(int actorId) {
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
	
	// addActorFile
	public void addActorFile(ActorForm actorForm, String path) {
		if(actorForm.getActorFile() != null) {
			// 파일 입력
			List<MultipartFile> list = actorForm.getActorFile();
			for(MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();
				actorFile.setActorId(actorForm.getActorId());
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());
				String fileName = UUID.randomUUID().toString().replace("-", "");
				actorFile.setFilename(fileName);
				int dotInx = mf.getOriginalFilename().lastIndexOf(".");
				String originname = mf.getOriginalFilename().substring(0,dotInx);
				String ext = mf.getOriginalFilename().substring(dotInx+1);
				actorFile.setOriginname(originname);
				actorFile.setExt(ext);
				
				int row = actorFileMapper.insertActorFile(actorFile);
				if(row == 1) {
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
