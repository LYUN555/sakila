package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

// logging 프레임워크
@Slf4j
@Controller
public class Hello {
	@GetMapping("/hello")
	public String hello() {
		log.debug("gg");
		return "hello";
	}
}
