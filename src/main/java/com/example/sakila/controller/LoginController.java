package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	@Autowired
	private StaffMapper staffMapper;
	
	
	
	// logout action
	@GetMapping("/on/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("/off/logout 실행됨.");
		return "redirect:/off/login";
	}
	
	// login form
	@GetMapping("/off/login")
	public String login() {
		
		log.debug("/off/login 실행됨.");
		
		return "off/login";
	}
	
	// login action
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
						@RequestParam(name = "staffId") int staffId, // int staffId = Integer.parseInt(request.getParameter("")),...
						@RequestParam(name = "password") String password) { 
		
		Staff parmaStaff = new Staff();
		parmaStaff.setStaffId(staffId);
		parmaStaff.setPassword(password);
		
		Staff loginStaff = staffMapper.login(parmaStaff);
		if(loginStaff == null) {
			model.addAttribute("msg", "로그인 실패");
			return "off/login"; // 포워딩
		}
		session.setAttribute("loginStaff", loginStaff);
		
		return "redirect:/on/main";
	}
	
	
	
}
