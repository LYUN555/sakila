package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired
	private ActorService actorService;
	
	@GetMapping("/on/actorList")
	public String actorList(@RequestParam(defaultValue = "1") int currentPage, 
							@RequestParam(defaultValue = "10") int rowPerPage) {
		return "on/actorList";
	}
	
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session,ActorForm actorForm) {
		log.debug("actorForm : "+actorForm.toString());
		String path = session.getServletContext().getRealPath("/upload/");
		actorService.addActor(actorForm, path);
		return "redirect:/on/actorList";
	}
}
