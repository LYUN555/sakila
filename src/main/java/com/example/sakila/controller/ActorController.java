package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired
	private ActorService actorService;
	@Autowired
	private ActorFileService actorFileService;
	@Autowired
	private FilmService filmService;
	
	
	@GetMapping("/on/actorOne")
	public String actorOne(Model model, @RequestParam int actorId) {
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.getActorFileListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		model.addAttribute("actor",actor);
		model.addAttribute("actorFileList",actorFileList);
		model.addAttribute("filmList",filmList);
		return "on/actorOne";
	}
	
	@GetMapping("/on/actorList")
	public String actorList(Model model,
							@RequestParam(defaultValue = "1") int currentPage, 
							@RequestParam(defaultValue = "10") int rowPerPage,
							@RequestParam(required = false) String searchWord) {
		log.debug("searchWord : "+searchWord);
		
		int lastPage = actorService.getTotalCount(rowPerPage, searchWord);
		log.debug("lastPage : "+lastPage);
		log.debug("currentPage : "+currentPage);
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		model.addAttribute("actorList",actorList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("searchWord",searchWord);
		return "on/actorList";
	}
	
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session, Model model, ActorForm actorForm) {
		List<MultipartFile> list = actorForm.getActorFile();
		if(list != null && list.size() != 0) { // 첨부된 파일이 있다면
			for(MultipartFile f : list) {
				if(!f.getContentType().equals("image/jpeg") && !f.getContentType().equals("image/png")) {
					model.addAttribute("msg","이미지 파일만 입력이 가능합니다");
					return "on/addActor";
				}
			}
		}
		
		log.debug("actorForm : "+actorForm.toString());
		String path = session.getServletContext().getRealPath("/upload/");
		actorService.addActor(actorForm, path);
		return "redirect:/on/actorList";
	}
}
