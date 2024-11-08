package com.example.sakila.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class FilmActorController {
	@Autowired
	FilmActorService filmActorService;
	
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(Model model,FilmActor filmActor) {
		log.debug("filmId :"+filmActor.getFilmId());
		log.debug("actorId :"+filmActor.getActorId());
		
		int count = filmActorService.countFilmActor(filmActor);
		if(count == 0) {
			filmActorService.addFilmActor(filmActor);
			return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
		}
		String msg = "이미 존재하는 영화입니다";
		try {
			msg = URLEncoder.encode(msg, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId()+"&msg="+msg;
	}
	
	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		
		int row = filmActorService.removeFilmActor(filmActor);
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
	
}
