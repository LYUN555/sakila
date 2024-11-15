package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.sakila.service.CategoryService;
import com.example.sakila.vo.Category;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService; 
	
	
	@GetMapping("on/categoryList")
	public String categoryList(Model model) {
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList: "+categoryList);
		model.addAttribute("categoryList",categoryList);
		
		return "/on/categoryList";
	}
}
